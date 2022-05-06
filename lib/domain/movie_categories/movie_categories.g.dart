// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCategories _$MovieCategoriesFromJson(Map<String, dynamic> json) =>
    MovieCategories(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCategoriesToJson(MovieCategories instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
