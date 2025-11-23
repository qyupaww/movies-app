import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/movie_general.dart';
import '../../model/movie_response_data.dart';
import '../../service/tmdb_client_api.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TmdbClientApi _tmdbClientApi;

  SearchBloc(
    this._tmdbClientApi,
  ) : super(SearchState()) {
    on<SearchInitEvent>(_onInitSearch);
    on<SearchQueryEvent>(_onQuerySearch);
  }

  void _onInitSearch(
    SearchInitEvent event,
    Emitter<SearchState> emit,
  ) async {
    MovieResponseData data = await _tmdbClientApi.getNowPlayingMovies(
      page: 1,
      language: 'en-US',
    );

    List<MovieGeneral> movies = data.results;

    emit(SearchState(
      status: SearchStatus.loaded,
      movies: movies,
    ));
  }

  void _onQuerySearch(
    SearchQueryEvent event,
    Emitter<SearchState> emit,
  ) async {
    MovieResponseData data = await _tmdbClientApi.getMoviesByQuery(
      query: event.query,
      includeAdult: true,
      language: 'en-US',
      page: 1,
    );

    List<MovieGeneral> movies = data.results;

    emit(SearchState(
      status: SearchStatus.loadedSearchResult,
      movies: movies,
    ));
  }
}
