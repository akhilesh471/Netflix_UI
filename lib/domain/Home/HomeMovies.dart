import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/domain/downloads/download_widget_model/download_widget_model.dart';

String TopMovies =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US&page=1';
String PopularMovies =
    'https://api.themoviedb.org/3/movie/popular?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US&page=1';
String TrendingMovies =
    'https://api.themoviedb.org/3/trending/all/day?api_key=4d546658d78f0a1da280fe4c87755ed4';
String NewReleaseMovies =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US&page=1';
String TvOnAir =
    'https://api.themoviedb.org/3/tv/on_the_air?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US&page=1';

Future<DownloadWidgetModel> getTopRatedImages() async {
  final _response = await http.get(Uri.parse(TopMovies));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = DownloadWidgetModel.fromJson(_bodyAsJson);

  return data;
}

Future<DownloadWidgetModel> getPopularMoviesImages() async {
  final _response = await http.get(Uri.parse(PopularMovies));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = DownloadWidgetModel.fromJson(_bodyAsJson);

  return data;
}

Future<DownloadWidgetModel> getTrendingMoviesImages() async {
  final _response = await http.get(Uri.parse(TrendingMovies));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = DownloadWidgetModel.fromJson(_bodyAsJson);

  return data;
}

Future<DownloadWidgetModel> getNewReleaseMoviesImages() async {
  final _response = await http.get(Uri.parse(NewReleaseMovies));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = DownloadWidgetModel.fromJson(_bodyAsJson);
  ;
  return data;
}

Future<DownloadWidgetModel> getTvOnAir() async {
  final _response = await http.get(Uri.parse(TvOnAir));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = DownloadWidgetModel.fromJson(_bodyAsJson);
  print('kitti');
  print(data.results![0].posterPath);
  return data;
}
