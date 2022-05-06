import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/domain/downloads/download_widget_model/download_widget_model.dart';

Future<DownloadWidgetModel> getDownloadImages() async {
  final _response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/trending/all/day?api_key=4d546658d78f0a1da280fe4c87755ed4'));
  Map<String, dynamic> _bodyAsJson = jsonDecode(_response.body);
  final data = DownloadWidgetModel.fromJson(_bodyAsJson);
  return data;
}
