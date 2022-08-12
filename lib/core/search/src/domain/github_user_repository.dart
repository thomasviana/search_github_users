import 'github_user.dart';

abstract class GithubUserRepository {
  Future<List<GithubUser>> getGithubUsers(String query);
}
