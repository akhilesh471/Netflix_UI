import 'package:flutter/material.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/domain/full_model/full_model.dart';
import 'package:netflix/domain/newandHot/newandhortFunction.dart';
import 'package:netflix/presentation/search/widgets/heading.dart';

class SearchResults extends StatefulWidget {
  SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSearchResult(),
        builder: (BuildContext context, AsyncSnapshot<FullModel> snapshot) {
          if (snapshot.hasError) {
            Text('');
          }
          return (snapshot.hasData)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadingText(title: 'Movies & TV'),
                    kheight,
                    Expanded(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1 / 1.4,
                        children: List.generate(
                          20,
                          (index) {
                            return MainCard(
                              image:
                                  '$url${snapshot.data!.results![index].posterPath}',
                            );
                          },
                        ),
                      ),
                    )
                  ],
                )
              : SizedBox();
        });
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}
