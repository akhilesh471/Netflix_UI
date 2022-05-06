import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/constats/colors/colors.dart';

import 'package:netflix/constats/main_title_card/main_title_card.dart';
import 'package:netflix/constats/sidetitle/side_title.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/domain/Home/HomeMovies.dart';
import 'package:netflix/domain/categoriesFunctions/categories_functions.dart';
import 'package:netflix/presentation/homescreen/widgets/background_card.dart';
import 'package:netflix/presentation/homescreen/widgets/numberCard/numbercard.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getTopRatedImages();
    getPopularMoviesImages();
    getTrendingMoviesImages();
    getNewReleaseMoviesImages();
    getTvOnAir();
    getMovieCategories();
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: ScrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    ScrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    ScrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        BackgroundImageCard(),
                        kheight20,
                        const MainTitleCard(title: 'Get Tv On Air', number: 1),
                        kheight20,
                        const MainTitleCard(
                          title: 'Popular On Netflix',
                          number: 2,
                        ),
                        kheight20,
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SideTitleWidget(
                                  title: 'Top 10 in India Today'),
                              kheight,
                              LimitedBox(
                                maxHeight: 190,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                    10,
                                    (index) => NumberCard(
                                      index: index,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        kheight20,
                        const MainTitleCard(
                          title: 'Trending Now',
                          number: 3,
                        ),
                        kheight20,
                        const MainTitleCard(
                          title: 'New Release',
                          number: 4,
                        )
                      ],
                    ),
                    ScrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            height: 95,
                            color: Colors.black.withOpacity(0.3),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                        'lib/assets/netflix.png',
                                      ),
                                      height: 70,
                                      width: 40,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.cast,
                                      color: kiconWhiteColor,
                                      size: 25,
                                    ),
                                    kwidth20,
                                    const SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: Image(
                                          image: AssetImage(
                                              'lib/assets/avatarimage.jpg')),
                                    ),
                                    kwidth20
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    navBarText('TV Shows'),
                                    navBarText('Movies'),
                                    Row(
                                      children: [
                                        navBarText('Categories'),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                          size: 25,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight
                  ],
                ),
              );
            }));
  }
}

Text navBarText(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 14, color: Colors.white),
  );
}
