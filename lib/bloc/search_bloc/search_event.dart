part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchInitEvent extends SearchEvent {}

class SearchQueryEvent extends SearchEvent {
  final String query;

  SearchQueryEvent(this.query);
}
