part of 'movie_detail_bloc.dart';

enum MovieDetailStatus {
  initial,
  loaded,
}

class MovieDetailState {
  final MovieDetailStatus status;
  final MovieDetails movieDetails;
  final List<MovieGeneral> similarMovies;
  final bool isFavorite;

  const MovieDetailState({
    this.status = MovieDetailStatus.initial,
    this.movieDetails = const MovieDetails(),
    this.similarMovies = const <MovieGeneral>[],
    this.isFavorite = false,
  });

  MovieDetailState copyWith({
    MovieDetailStatus? status,
    MovieDetails? movieDetails,
    List<MovieGeneral>? similarMovies,
    bool? isFavorite,
  }) {
    return MovieDetailState(
      status: status ?? this.status,
      movieDetails: movieDetails ?? this.movieDetails,
      similarMovies: similarMovies ?? this.similarMovies,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
