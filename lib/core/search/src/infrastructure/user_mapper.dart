import 'package:injectable/injectable.dart';
import 'package:search_github_users/core/search/domain.dart';
import 'package:search_github_users/presentation/theme/theme.dart';

@injectable
class UserMapper {
  GithubUser fromJson(Map jsonObj) {
    final String id = jsonObj['id']?.toString() ?? '';
    final String name = jsonObj['login'] ?? 'Unknown';
    final int totalRepos = jsonObj['public_repos'] ?? 0;
    final String imageUrl = jsonObj['avatar_url'] ?? kDefaultAvatar;

    return GithubUser(
      id: id,
      name: name,
      totalRepos: totalRepos,
      imageUrl: imageUrl,
    );
  }

  List<GithubUser> fromJsonArray(List jsonArray) =>
      jsonArray.map((e) => fromJson(e)).toList();
}
