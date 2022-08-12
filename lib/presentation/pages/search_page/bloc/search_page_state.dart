part of 'search_page_bloc.dart';

abstract class SearchPageState extends Equatable {
  const SearchPageState();

  @override
  List<Object> get props => [];
}

class SearchPageInitial extends SearchPageState {}

class SearchPageLoading extends SearchPageState {}

class SearchPageLoaded extends SearchPageState {
  final List<GithubUser> users;

  const SearchPageLoaded(this.users);
}

class SearchPageEmptyState extends SearchPageState {}

class SearchPageError extends SearchPageState {
  final HttpException exception;

  const SearchPageError(this.exception);
}
