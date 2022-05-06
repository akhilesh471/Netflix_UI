import 'package:flutter/material.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/constats/video_widget/videoWidget.dart';
import 'package:netflix/domain/full_model/full_model.dart';
import 'package:netflix/domain/newandHot/newandhortFunction.dart';
import 'package:netflix/presentation/homescreen/widgets/playbutton_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constats/size_h_w/size_h_w.dart';

class EveryoneWatchingwidget extends StatelessWidget {
  const EveryoneWatchingwidget({Key? key, required this.index})
      : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getEveryoneWatchedata(),
        builder: (BuildContext context, AsyncSnapshot<FullModel> snapshot) {
          return (snapshot.hasData)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kheight,
                      VideoWidget2(
                          image:
                              '$url${snapshot.data!.results![index].posterPath}'),
                      kheight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${snapshot.data!.results![index].title}',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: const [
                              HomeButtons(
                                icon: Icons.telegram,
                                text: 'Share',
                                iconsize: 33,
                                textsize: 11,
                              ),
                              kwidth,
                              HomeButtons(
                                icon: Icons.add,
                                text: 'My List',
                                iconsize: 33,
                                textsize: 11,
                              ),
                              kwidth,
                              HomeButtons(
                                icon: Icons.play_arrow,
                                text: 'Play',
                                iconsize: 33,
                                textsize: 11,
                              ),
                            ],
                          ),
                        ],
                      ),
                      kheight,
                      Text(
                        '${snapshot.data!.results![index].title}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      kheight17,
                      Text(
                        '${snapshot.data!.results![index].overview}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    SizedBox(),
                  ],
                );
        });
  }
}
