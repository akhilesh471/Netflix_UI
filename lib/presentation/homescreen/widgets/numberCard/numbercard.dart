import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/domain/Home/HomeMovies.dart';

import '../../../../domain/downloads/download_widget_model/download_widget_model.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTopRatedImages(),
        builder: (context, AsyncSnapshot<DownloadWidgetModel> snapshot) {
          if (snapshot.hasError) {
            return Text('error');
          }
          if (snapshot.hasData) {
            return Stack(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 40, height: 150),
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: kradius,
                          image: DecorationImage(
                              image: NetworkImage(
                                  '$url${snapshot.data!.results![index].posterPath}'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                Positioned(
                  left: 3,
                  top: 87,
                  child: BorderedText(
                    strokeWidth: 4.0,
                    strokeColor: Colors.white,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        });
  }
}
