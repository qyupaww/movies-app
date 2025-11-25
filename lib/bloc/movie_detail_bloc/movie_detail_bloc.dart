import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/service/tmdb_client_api.dart';

import '../../model/movie_details.dart';
import '../../model/movie_general.dart';
import '../../service/shared_preferences.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final TmdbClientApi _tmdbClientApi;
  final MoviesSharedPreferences _sharedPreferences;

  MovieDetailBloc(
    this._tmdbClientApi,
    this._sharedPreferences,
  ) : super(MovieDetailState()) {
    on<MovieDetailInitEvent>(_onInitMovieDetail);
    on<MovieDetailAddFavoriteEvent>(_onAddToFavorite);
  }

  void _onInitMovieDetail(
    MovieDetailInitEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    final MovieDetails movieDetails =
        await _tmdbClientApi.getMovieDetailsById(movieId: event.movieId);
    final result = await _tmdbClientApi.getSimilarMovieDetailsById(
      movieId: event.movieId,
      language: "en-US",
      page: 1,
    );
    final similarMovies = result.results;

    final favorites = await _sharedPreferences.getAllMovies();
    final isFavorite = favorites.any((movie) => movie.id == event.movieId);

    emit(MovieDetailState(
      status: MovieDetailStatus.loaded,
      movieDetails: movieDetails,
      similarMovies: similarMovies,
      isFavorite: isFavorite,
    ));
  }

  void _onAddToFavorite(
    MovieDetailAddFavoriteEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    final favorites = await _sharedPreferences.getAllMovies();

    final isAlreadyFavorited =
        favorites.any((movie) => movie.id == event.movie.id);

    if (isAlreadyFavorited) {
      await _sharedPreferences.deleteMovieById(event.movie.id);
    } else {
      await _sharedPreferences.addMovies(event.movie);
    }

    emit(state.copyWith(
      status: MovieDetailStatus.loaded,
      isFavorite: !isAlreadyFavorited,
    ));
  }
}
