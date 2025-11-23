part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loaded,
}

class HomeState {
  final HomeStatus status;
  final MovieGeneral? movie;
  final List<MovieSection> section;

  const HomeState({
    this.status = HomeStatus.initial,
    this.movie,
    this.section = const <MovieSection>[],
  });

  HomeState copywith({
    HomeStatus? status,
    MovieGeneral? movie,
    List<MovieSection>? section,
  }) {
    return HomeState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      section: section ?? this.section,
    );
  }
}
