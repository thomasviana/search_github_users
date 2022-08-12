import 'package:injectable/injectable.dart';
import 'package:search_github_users/core/search/domain.dart';
import 'package:search_github_users/core/search/infrastructure.dart';

@LazySingleton(as: GithubUserRepository)
class GithubUserRepositoryImpl implements GithubUserRepository {
  final ApiClient _apiClient;
  final UserMapper _userMapper;

  GithubUserRepositoryImpl(
    this._apiClient,
    this._userMapper,
  );

  @override
  Future<List<GithubUser>> getGithubUsers(String query) async => _apiClient
      .fetchGithubUsers(query)
      .then((usersWithDetails) => _userMapper.fromJsonArray(usersWithDetails));
}
