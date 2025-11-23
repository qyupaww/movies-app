part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loaded,
}

class HomeState {
  final HomeStatus status;
  final MovieGeneral? movie;
  final List<MovieSection> sections;

  const HomeState({
    this.status = HomeStatus.initial,
    this.movie,
    this.sections = const <MovieSection>[],
  });

  HomeState copywith({
    HomeStatus? status,
    MovieGeneral? movie,
    List<MovieSection>? sections,
  }) {
    return HomeState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      sections: sections ?? this.sections,
    );
  }
}
