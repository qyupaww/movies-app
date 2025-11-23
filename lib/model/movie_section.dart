import '../constants.dart';
import 'movie_general.dart';

class MovieSection {
  final String title;
  final HomeSectionType sectionType;
  final List<MovieGeneral> movies;

  const MovieSection({
    required this.title,
    required this.sectionType,
    required this.movies,
  });
}
