part of 'search_bloc.dart';

enum SearchStatus {
  initial,
  loaded,
  loadedSearchResult,
}

class SearchState {
  final SearchStatus status;
  final List<MovieGeneral> movies;

  const SearchState({
    this.status = SearchStatus.initial,
    this.movies = const <MovieGeneral>[],
  });

  SearchState copywith({
    SearchStatus? status,
    List<MovieGeneral>? movies,
  }) {
    return SearchState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }
}
