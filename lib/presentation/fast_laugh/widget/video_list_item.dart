import 'package:flutter/material.dart';
import 'package:netflix/constats/colors/colors.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/domain/Home/HomeMovies.dart';
import 'package:netflix/domain/downloads/download_widget_model/download_widget_model.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTvOnAir(),
      builder: (context, AsyncSnapshot<DownloadWidgetModel> snapshot) {
        if (snapshot.hasError) {
          return Text('');
        }
        if (snapshot.hasData) {
          return Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: Image(
                  image: NetworkImage(
                      '$url${snapshot.data!.results![index].posterPath}'),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.volume_mute_outlined,
                          color: kiconWhiteColor,
                          size: 30,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              '$url${snapshot.data!.results![index].posterPath}',
                            ),
                          ),
                        ),
                        kheight,
                        VideoActionButton(
                            icon: Icons.emoji_emotions_outlined, title: 'LOL'),
                        VideoActionButton(icon: Icons.add, title: 'My List'),
                        VideoActionButton(icon: Icons.share, title: 'Share'),
                        VideoActionButton(
                            icon: Icons.play_arrow_sharp, title: 'play'),
                        kheight
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class VideoActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionButton({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Column(
        children: [
          Icon(
            icon,
            color: kiconWhiteColor,
            size: 30,
          ),
          Text(title, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
