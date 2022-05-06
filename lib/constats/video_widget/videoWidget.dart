import 'package:flutter/material.dart';
import 'package:netflix/constats/colors/colors.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/domain/full_model/full_model.dart';
import 'package:netflix/domain/newandHot/newandhortFunction.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getComingSoonData(),
        builder: (context, AsyncSnapshot<FullModel> snapshot) {
          if (snapshot.hasError) {
            return Text('');
          }
          if (snapshot.hasData) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: kradius,
                    image: DecorationImage(
                        image: NetworkImage(
                            '$url${snapshot.data!.results![index].posterPath}'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_mute_outlined,
                      color: kiconWhiteColor,
                      size: 30,
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

class VideoWidget2 extends StatelessWidget {
  const VideoWidget2({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 210,
          decoration: BoxDecoration(
            borderRadius: kradius,
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.volume_mute_outlined,
              color: kiconWhiteColor,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
