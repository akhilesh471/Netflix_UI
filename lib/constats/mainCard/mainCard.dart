import 'package:flutter/material.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/domain/Home/HomeMovies.dart';
import 'package:netflix/domain/downloads/download_widget_model/download_widget_model.dart';

class MainCard1 extends StatelessWidget {
  const MainCard1({Key? key, required this.index, required this.number})
      : super(key: key);
  final int index;
  final int number;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTvOnAir(),
      builder: (context, AsyncSnapshot<DownloadWidgetModel> snapshot) {
        if (snapshot.hasError) {
          return Text('');
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 130,
              // height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: kradius,
                  image: DecorationImage(
                      image: NetworkImage(
                          '$url${snapshot.data!.results![index].posterPath}'),
                      fit: BoxFit.cover)),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class MainCard2 extends StatelessWidget {
  const MainCard2({Key? key, required this.index, required this.number})
      : super(key: key);
  final int index;
  final int number;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPopularMoviesImages(),
      builder: (context, AsyncSnapshot<DownloadWidgetModel> snapshot) {
        if (snapshot.hasError) {
          return Text('');
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 130,
              // height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: kradius,
                  image: DecorationImage(
                      image: NetworkImage(
                          '$url${snapshot.data!.results![index].posterPath}'),
                      fit: BoxFit.cover)),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class MainCard3 extends StatelessWidget {
  const MainCard3({Key? key, required this.index, required this.number})
      : super(key: key);
  final int index;
  final int number;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTrendingMoviesImages(),
      builder: (context, AsyncSnapshot<DownloadWidgetModel> snapshot) {
        if (snapshot.hasError) {
          return Text('');
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 130,
              // height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: kradius,
                  image: DecorationImage(
                      image: NetworkImage(
                          '$url${snapshot.data!.results![index].posterPath}'),
                      fit: BoxFit.cover)),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class MainCard4 extends StatelessWidget {
  const MainCard4({Key? key, required this.index, required this.number})
      : super(key: key);
  final int index;
  final int number;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNewReleaseMoviesImages(),
      builder: (context, AsyncSnapshot<DownloadWidgetModel> snapshot) {
        if (snapshot.hasError) {
          return Text('');
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 130,
              // height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: kradius,
                  image: DecorationImage(
                      image: NetworkImage(
                          '$url${snapshot.data!.results![index].posterPath}'),
                      fit: BoxFit.cover)),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
