part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent {}

class MovieDetailInitEvent extends MovieDetailEvent {
  final int movieId;

  MovieDetailInitEvent(this.movieId);
}

class MovieDetailAddFavoriteEvent extends MovieDetailEvent {
  final MovieGeneral movie;

  MovieDetailAddFavoriteEvent(this.movie);
}
