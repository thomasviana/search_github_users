// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search_github_users/core/search/application.dart';
import 'package:search_github_users/core/search/domain.dart';
import 'package:search_github_users/utils/http.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

@injectable
class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final SearchGithubUsers _searchGithubUsers;

  SearchPageBloc(
    this._searchGithubUsers,
  ) : super(SearchPageInitial()) {
    EventTransformer<Event> debounceSequential<Event>(Duration duration) {
      return (events, mapper) =>
          events.debounceTime(duration).asyncExpand(mapper);
    }

    on<QueryChangedEvent>((event, emit) async {
      if (event.query.isEmpty) {
        emit(SearchPageInitial());
      } else {
        emit(SearchPageLoading());
        try {
          final usersFound = await _searchGithubUsers(query: event.query);
          if (usersFound.isEmpty) {
            emit(SearchPageEmptyState());
          } else {
            emit(SearchPageLoaded(usersFound));
          }
        } on HttpException catch (e) {
          emit(SearchPageError(e));
        }
      }
    }, transformer: debounceSequential(const Duration(milliseconds: 1000)));
  }
}
