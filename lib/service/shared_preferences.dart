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

  List<MovieGeneral> _convertJsonToMovieLists(String movieJson) {
    return (json.decode(movieJson) as List<dynamic>)
        .map((movieJson) =>
            MovieGeneral.fromJson(movieJson as Map<String, dynamic>))
        .toList();
  }
}
