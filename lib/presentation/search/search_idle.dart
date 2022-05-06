import 'package:flutter/material.dart';
import 'package:netflix/constats/colors/colors.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/domain/full_model/full_model.dart';
import 'package:netflix/domain/newandHot/newandhortFunction.dart';
import 'package:netflix/presentation/search/widgets/heading.dart';

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSearchIdle(),
        builder: (BuildContext context, AsyncSnapshot<FullModel> snapshot) {
          if (snapshot.hasError) {
            return Text('');
          }
          return (snapshot.hasData)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kheight,
                    HeadingText(title: 'Top Searches'),
                    kheight,
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return TopSearchTile(
                              image:
                                  '$url${snapshot.data!.results![index].posterPath}',
                              title: '${snapshot.data!.results![index].title}',
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return kheight;
                          },
                          itemCount: 10),
                    ),
                  ],
                )
              : SizedBox();
        });
  }
}

class TopSearchTile extends StatelessWidget {
  TopSearchTile({Key? key, required this.image, required this.title})
      : super(key: key);
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 87,
          width: ScreenWidth * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: kiconWhiteColor,
          radius: 23,
          child: const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 21,
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
