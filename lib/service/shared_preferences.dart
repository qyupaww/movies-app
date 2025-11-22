import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/movie_general.dart';

class MoviesSharedPreferences {
  static const myMoviesListKey = "my_movies_list_key";

  MoviesSharedPreferences() {
    _initSharedPreferences();
  }

  SharedPreferences? _sharedPreferences;

  Future<void> _initSharedPreferences() async {
    if (_sharedPreferences != null) return;
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<List<MovieGeneral>> getAllMovies() async {
    await _initSharedPreferences();
    if (_sharedPreferences != null) {
      final moviesJson = _sharedPreferences!.getString(myMoviesListKey);

      if (moviesJson != null) {
        List<MovieGeneral> movieLists = _convertJsonToMovieLists(moviesJson);
        return movieLists;
      } else {
        return [];
      }
    }
    return [];
  }

  Future<void> addMovies(MovieGeneral movie) async {
    await _initSharedPreferences();

    if (_sharedPreferences != null) {
      final moviesJson = _sharedPreferences!.getString(myMoviesListKey);

      if (moviesJson != null) {
        List<MovieGeneral> movies = _convertJsonToMovieLists(moviesJson);
        final movieIndex = movies.indexWhere((m) => m.id == movie.id);
        if (movieIndex >= 0) {
          return;
        } else {
          movies.add(movie);
        }

        _sharedPreferences!.setString(myMoviesListKey, jsonEncode(movies));
      } else {
        List<MovieGeneral> movies = [movie];
        _sharedPreferences!.setString(myMoviesListKey, jsonEncode(movies));
      }
    }
  }

  Future<void> deleteMovieById(int id) async {
    await _initSharedPreferences();

    if (_sharedPreferences != null) {
      final moviesJson = _sharedPreferences!.getString(myMoviesListKey);

      if (moviesJson != null) {
        List<MovieGeneral> movies = _convertJsonToMovieLists(moviesJson);
        final movieIndex = movies.indexWhere((m) => m.id == id);
        if (movieIndex == -1) {
          return;
        } else {
          movies.removeAt(movieIndex);
          _sharedPreferences!.setString(myMoviesListKey, jsonEncode(movies));
        }
      }
    }
  }

  List<MovieGeneral> _convertJsonToMovieLists(String movieJson) {
    return (json.decode(movieJson) as List<dynamic>)
        .map((movieJson) =>
            MovieGeneral.fromJson(movieJson as Map<String, dynamic>))
        .toList();
  }
}
