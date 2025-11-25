part of "list_bloc.dart";

enum MyListStatus {
  initial,
  loaded,
  empty,
}

class MyListState {
  final MyListStatus status;
  final List<MovieGeneral> movies;

  const MyListState({
    this.status = MyListStatus.initial,
    this.movies = const <MovieGeneral>[],
  });

  MyListState copyWith({
    MyListStatus? status,
    List<MovieGeneral>? movies,
  }) {
    return MyListState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }
}
