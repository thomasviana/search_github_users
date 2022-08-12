import 'package:injectable/injectable.dart';
import 'package:search_github_users/core/search/domain.dart';

@injectable
class SearchGithubUsers {
  final GithubUserRepository _githubUserRepository;

  SearchGithubUsers(this._githubUserRepository);

  Future<List<GithubUser>> call({required String query}) async =>
      _githubUserRepository.getGithubUsers(query);
}
