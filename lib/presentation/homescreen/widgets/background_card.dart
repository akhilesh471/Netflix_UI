import 'package:flutter/material.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/domain/Home/HomeMovies.dart';
import 'package:netflix/domain/downloads/download_widget_model/download_widget_model.dart';
import 'package:netflix/presentation/homescreen/widgets/playbutton_widget.dart';

class BackgroundImageCard extends StatelessWidget {
  const BackgroundImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPopularMoviesImages(),
        builder: (context, AsyncSnapshot<DownloadWidgetModel> snapshot) {
          if (snapshot.hasError) {
            return Text('');
          }
          if (snapshot.hasData) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          '$url${snapshot.data!.results![0].posterPath}'),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Column(
                    children: [
                      Text(
                        'Action&Adventure • Drama',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          HomeButtons(
                            icon: Icons.add,
                            text: 'MyList',
                            iconsize: 20,
                            textsize: 13,
                          ),
                          PlayButton(),
                          HomeButtons(
                            icon: Icons.info,
                            text: 'Info',
                            iconsize: 20,
                            textsize: 13,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return CircularProgressIndicator();
        });
  }
}
