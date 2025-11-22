import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/movie_details.dart';
import '../model/movie_response_data.dart';

part 'tmdb_client_api.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class TmdbClientApi {
  factory TmdbClientApi(Dio dio, {String baseUrl}) = _TmdbClientApi;

  @GET('/trending/movie/{time}?language=en-US')
  Future<MovieResponseData> getTrendingMovieBy(
    @Path('time') String time,
  );

  @GET('/movie/now_playing')
  Future<MovieResponseData> getNowPlayingMovies({
    @Query('page') required int page,
    @Query('language') required String language,
  });

  @GET('/discover/movie')
  Future<MovieResponseData> getMoviesByGenre({
    @Query('include_adult') required bool includeAdult,
    @Query('include_video') required bool includeVideo,
    @Query('page') required int page,
    @Query('sort_by') required String sortBy,
    @Query('with_genres') required int withGenres,
    @Query('language') required int language,
  });

  @GET('/search.movie')
  Future<MovieResponseData> getMoviesByQuery({
    @Query('query') required String query,
    @Query('include_adult') required bool includeAdult,
    @Query('language') required int language,
    @Query('page') required int page,
  });

  @GET('movie/{id}')
  Future<MovieDetails> getMovieDetailsById({
    @Path('id') required int movieId,
  });

  @GET('movie/{id}/similar')
  Future<MovieDetails> getSimilarMovieDetailsById({
    @Path('id') required int movieId,
    @Query('language') required int language,
    @Query('page') required int page,
  });
}
