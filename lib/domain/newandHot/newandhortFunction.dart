import 'dart:convert';

import 'package:netflix/domain/full_model/full_model.dart';
import 'package:http/http.dart' as http;

const String getUpComingUrl =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US&page=';
const String getEveryoneWatching =
    'https://api.themoviedb.org/3/movie/popular?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US&page=1';

Future<FullModel> getComingSoonData() async {
  final _response = await http.get(Uri.parse(getUpComingUrl));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = FullModel.fromJson(_bodyAsJson);
//   print('kitti');
// // print(data.results![0].title);
  return data;
}

Future<FullModel> getEveryoneWatchedata() async {
  final _response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US&page=1'));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = FullModel.fromJson(_bodyAsJson);
//   print('kitti');
  print(data.results![0].title);
  return data;
}

Future<FullModel> getSearchResult() async {
  final _response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US&page=1'));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = FullModel.fromJson(_bodyAsJson);
//   print('kitti');
  print(data.results![0].title);
  return data;
}

Future<FullModel> getSearchIdle() async {
  final _response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US&page=1'));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = FullModel.fromJson(_bodyAsJson);
//   print('kitti');
  print(data.results![0].title);
  return data;
}
