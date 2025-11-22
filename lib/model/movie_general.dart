import 'package:json_annotation/json_annotation.dart';
part 'movie_general.g.dart';

@JsonSerializable(fieldRename: .snake)
class MovieGeneral {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final String? mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int>? genreIds;
  final double populariry;
  final String? releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieGeneral({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.backdropPath,
    this.posterPath,
    this.mediaType,
    this.adult = true,
    required this.originalLanguage,
    this.genreIds,
    this.populariry = 0.0,
    this.releaseDate,
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  factory MovieGeneral.fromJson(
    Map<String, dynamic> json,
  ) => _$MovieGeneralFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MovieGeneralToJson(this);
}
