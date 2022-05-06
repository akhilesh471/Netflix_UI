import 'package:flutter/material.dart';

class tabsNewsAndHot extends StatelessWidget {
  const tabsNewsAndHot({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Tab(
        text: title,
      ),
    );
  }
}
