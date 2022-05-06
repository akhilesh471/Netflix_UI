import 'package:json_annotation/json_annotation.dart';


part 'movie_categories.g.dart';

@JsonSerializable()
class MovieCategories {
  List<Genre>? genres;

  MovieCategories({this.genres});

  factory MovieCategories.fromJson(Map<String, dynamic> json) {
    return _$MovieCategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieCategoriesToJson(this);
}
@JsonSerializable()
class Genre {
  int? id;
  String? name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
