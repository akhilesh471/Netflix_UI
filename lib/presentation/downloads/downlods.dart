import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/constats/colors/colors.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/domain/downloads/download_widget_model/download_widget_model.dart';
import 'package:netflix/domain/downloads/functions.dart';
import 'package:netflix/presentation/appBar/appbarwidget.dart';

List<String> downloadimage = [
  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=640:*',
  'https://i2-prod.irishmirror.ie/incoming/article26185096.ece/ALTERNATES/s1200b/0_I220209_151028_100570909oTextTRMRMMGLPICT000255932810o.jpg',
  'https://kb.rspca.org.au/wp-content/uploads/2018/11/golder-retriever-puppy.jpeg'
];

class Download extends StatefulWidget {
  const Download({Key? key}) : super(key: key);

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    print('notworkimg');

    print('working');
    final Msize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: kiconWhiteColor,
                  ),
                  kwidth,
                  const Text('Smart Downloads')
                ],
              ),
            ),
            SizedBox(height: Msize.height * 0.08),
            const Text(
              downlodHeading,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                downloadContent,
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            FutureBuilder(
              future: getDownloadImages(),
              builder: (context, AsyncSnapshot<DownloadWidgetModel> snapShot) {
                if (snapShot.hasError) {
                  return Text('error');
                }
                if (snapShot.hasData) {
                  return Container(
                    height: Msize.height * 0.33,
                    width: Msize.width * 0.2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: Msize.width * 0.27,
                          backgroundColor: Colors.grey.withOpacity(0.4),
                        ),
                        DownloadsImageWidget(
                          image: '$url${snapShot.data!.results![0].posterPath}',
                          margin: const EdgeInsets.only(left: 130),
                          height: 0.19,
                          width: 0.29,
                          angle: 15,
                        ),
                        DownloadsImageWidget(
                          image: '$url${snapShot.data!.results![1].posterPath}',
                          margin: const EdgeInsets.only(right: 130),
                          height: 0.19,
                          width: 0.29,
                          angle: -15,
                        ),
                        DownloadsImageWidget(
                            image:
                                '$url${snapShot.data!.results![2].posterPath}',
                            margin: const EdgeInsets.only(top: 18),
                            height: 0.208,
                            width: 0.29),
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29.0, right: 29, top: 25),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () async {
                  final result = await getDownloadImages();
                  print('ha');
                  print(result.results![2].posterPath);
                  print('hello');
                },
                child: Text(
                  'Set Up',
                  style: TextStyle(
                      color: ktextWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                color: Colors.blue[700],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 58, right: 58),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
                child: const Text(
                  'See What You Can Download',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                color: ktextWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      required this.image,
      required this.margin,
      required this.height,
      required this.width,
      this.angle = 0})
      : super(key: key);
  final String image;
  final EdgeInsets margin;
  final double height;
  final double width;
  final double angle;
  @override
  Widget build(BuildContext context) {
    final Msize = MediaQuery.of(context).size;

    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        height: Msize.height * height,
        width: Msize.width * width,
        margin: margin,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.fill),
          color: Colors.purple,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
