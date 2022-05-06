
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/domain/movie_categories/movie_categories.dart';

Future<MovieCategories> getMovieCategories() async {
  final _response = await http.get(Uri.parse('https://api.themoviedb.org/3/genre/movie/list?api_key=4d546658d78f0a1da280fe4c87755ed4&language=en-US'));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = MovieCategories.fromJson(_bodyAsJson);
print('categoris');
print(data.genres![0].name);
  return data;
}