import 'package:json_annotation/json_annotation.dart';

part 'download_widget_model.g.dart';

@JsonSerializable()
class DownloadWidgetModel {
  @JsonKey(name: 'results')
  List<Result>? results;

  DownloadWidgetModel({
    this.results = const [],
  });

  factory DownloadWidgetModel.fromJson(Map<String, dynamic> json) {
    return _$DownloadWidgetModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DownloadWidgetModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  Result({
    this.id,
    this.posterPath,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
