import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/constats/colors/colors.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/constats/video_widget/videoWidget.dart';
import 'package:netflix/domain/full_model/full_model.dart';
import 'package:netflix/domain/newandHot/newandhortFunction.dart';
import 'package:netflix/presentation/homescreen/widgets/playbutton_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getComingSoonData(),
        builder: (context, AsyncSnapshot<FullModel> snapshot) {
          if (snapshot.hasError) {
            return Text('');
          }
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 460,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Feb',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          '11',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width - 60,
                    height: 460,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VideoWidget(index: index),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: const [
                                HomeButtons(
                                  icon: Icons.notifications_none_outlined,
                                  text: 'Remind Me',
                                  iconsize: 25,
                                  textsize: 11,
                                ),
                                HomeButtons(
                                  icon: Icons.info,
                                  text: 'info',
                                  iconsize: 25,
                                  textsize: 11,
                                ),
                                kwidth
                              ],
                            )
                          ],
                        ),
                        Text('Coming'),
                        kheight,
                        Text(
                          '${snapshot.data!.results![index].title}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        kheight17,
                        Expanded(
                          child: Text(
                            '${snapshot.data!.results![index].overview}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  String parsedate(DateTime date) {
    var format = DateFormat.MMMd();
    var dateString = format.format(date);
    final _split = dateString.split(' ');
    return '${_split.last}-${_split.first}';
  }
}
