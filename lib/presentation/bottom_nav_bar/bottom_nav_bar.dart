import 'package:flutter/material.dart';
import 'package:netflix/constats/constants.dart';

ValueNotifier<int> indexChangeNotifer = ValueNotifier(0);

class bottomNavaBar extends StatelessWidget {
  const bottomNavaBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifer,
      builder: (BuildContext context, int index, Widget? _) {
        return BottomNavigationBar(
          onTap: (value) {
            indexChangeNotifer.value = value;
          },
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColorz,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections), label: 'New & Hot'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined), label: 'FastLaughs'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_for_offline_outlined),
                label: 'Downlods'),
          ],
        );
      },
    );
  }
}
