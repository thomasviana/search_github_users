part of 'search_page_bloc.dart';

abstract class SearchPageEvent extends Equatable {
  const SearchPageEvent();

  @override
  List<Object> get props => [];
}

class QueryChangedEvent extends SearchPageEvent {
  final String query;

  const QueryChangedEvent(this.query);
}
