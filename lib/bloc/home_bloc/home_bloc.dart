import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movie_response_data.dart';
import 'package:movies_app/service/tmdb_client_api.dart';

import '../../constants.dart';
import '../../model/movie_general.dart';
import '../../model/movie_section.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TmdbClientApi _tmdbClientApi;

  HomeBloc(
    this._tmdbClientApi,
  ) : super(HomeState()) {
    on<HomeInitEvent>(_onInitHome);
  }

  void _onInitHome(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeState(status: HomeStatus.loading));

    List<MovieResponseData> results = await Future.wait([
      _tmdbClientApi.getTrendingMovieBy("day"),
      _tmdbClientApi.getTrendingMovieBy("week"),
      _tmdbClientApi.getMoviesByGenre(
        includeAdult: true,
        includeVideo: false,
        page: 1,
        sortBy: "popularity.desc",
        withGenres: 35,
        language: "en-US",
      ),
      _tmdbClientApi.getMoviesByGenre(
        includeAdult: true,
        includeVideo: false,
        page: 1,
        sortBy: "popularity.desc",
        withGenres: 18,
        language: "en-US",
      ),
      _tmdbClientApi.getMoviesByGenre(
        includeAdult: true,
        includeVideo: false,
        page: 1,
        sortBy: "popularity.desc",
        withGenres: 36,
        language: "en-US",
      ),
      _tmdbClientApi.getMoviesByGenre(
        includeAdult: true,
        includeVideo: false,
        page: 1,
        sortBy: "popularity.desc",
        withGenres: 27,
        language: "en-US",
      ),
      _tmdbClientApi.getNowPlayingMovies(
        page: 1,
        language: "en-US",
      ),
    ]);

    List<MovieSection> sections = [
      MovieSection(
          title: "Trending of the Day",
          sectionType: HomeSectionType.trendingDay,
          movies: results[0].results),
      MovieSection(
          title: "Trending of the Week",
          sectionType: HomeSectionType.trendingWeek,
          movies: results[1].results),
      MovieSection(
          title: "Comedy Genre",
          sectionType: HomeSectionType.comedy,
          movies: results[2].results),
      MovieSection(
          title: "Drama Genre",
          sectionType: HomeSectionType.drama,
          movies: results[3].results),
      MovieSection(
          title: "History Genre",
          sectionType: HomeSectionType.history,
          movies: results[4].results),
      MovieSection(
          title: "Horror Genre",
          sectionType: HomeSectionType.horror,
          movies: results[5].results),
    ];

    MovieGeneral movie = results[6].results[0];

    emit(HomeState(
      status: HomeStatus.loaded,
      movie: movie,
      sections: sections,
    ));
  }
}
