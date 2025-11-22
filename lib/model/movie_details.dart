import 'package:json_annotation/json_annotation.dart';
import 'genre.dart';
part 'movie_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetails {
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String title;
  final int runtime;
  final String? releaseDate;
  final List<Genre>? genres;
  final String? backdropPath;

  const MovieDetails({
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.title,
    required this.runtime,
    this.releaseDate,
    this.genres,
    this.backdropPath,
  });

  factory MovieDetails.fromJson(
    Map<String, dynamic> json,
  ) => _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MovieDetailsToJson(this);
}
