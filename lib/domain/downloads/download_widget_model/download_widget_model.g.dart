// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_widget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadWidgetModel _$DownloadWidgetModelFromJson(Map<String, dynamic> json) =>
    DownloadWidgetModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DownloadWidgetModelToJson(
        DownloadWidgetModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
    };
