import 'package:flutter/material.dart';
import 'package:netflix/presentation/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:netflix/presentation/downloads/downlods.dart';
import 'package:netflix/presentation/fast_laugh/fast_laugh.dart';
import 'package:netflix/presentation/homescreen/home.dart';
import 'package:netflix/presentation/news_and_hot/new_hot.dart';
import 'package:netflix/presentation/search/search.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final _pages = [HomePage(), NewAndHot(), FastLaugh(), Search(), Download()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifer,
        builder: (BuildContext context, int index, Widget? _) {
          return SafeArea(child: _pages[index]);
        },
      ),
      bottomNavigationBar: const bottomNavaBar(),
    );
  }
}
