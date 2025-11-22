import 'package:json_annotation/json_annotation.dart';
import 'movie_general.dart';
part 'movie_response_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponseData {
  final int page;
  final List<MovieGeneral> results;
  final int totalPages;
  final int totalResults;

  const MovieResponseData({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponseData.fromJson(
    Map<String, dynamic> json,
  ) => _$MovieResponseDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MovieResponseDataToJson(this);
}
