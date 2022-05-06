import 'package:flutter/material.dart';
import 'package:netflix/constats/mainCard/mainCard.dart';
import 'package:netflix/constats/sidetitle/side_title.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({Key? key, required this.title, required this.number})
      : super(key: key);
  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideTitleWidget(title: title),
          kheight,
          LimitedBox(
              maxHeight: 190,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      List.generate(10, (index) => Rolling(index, number))))
        ],
      ),
    );
  }

  Rolling(int index, int number) {
    if (number == 1) {
      return MainCard1(index: index, number: number);
    }
    if (number == 2) {
      return MainCard2(index: index, number: number);
    }
    if (number == 3) {
      return MainCard3(index: index, number: number);
    }
    if (number == 4) {
      return MainCard4(index: index, number: number);
    }
  }
}
