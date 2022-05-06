import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constats/colors/colors.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/presentation/search/search_idle.dart';

import 'package:netflix/presentation/search/widgets/search_results.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  StatefulWidget search = SearchIdleWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              onTap: () {
                setState(() {
                  search = SearchResults();
                });
              },
              backgroundColor: Colors.grey.withOpacity(0.3),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: TextStyle(color: ktextWhiteColor),
            ),
            kheight,
            Expanded(child: search)
          ],
        ),
      )),
    );
  }
}
