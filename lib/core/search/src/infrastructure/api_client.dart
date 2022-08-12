import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:search_github_users/utils/http.dart';

@injectable
class ApiClient {
  ApiClient();

  final Map<String, String> headers = {
    'Accept': 'application/vnd.github+json',
  };

  Future<List> fetchGithubUsers(String query) async {
    final queryParameters = {'per_page': '100'};
    final usersUrl = Uri.https('api.github.com', '/users', queryParameters);

    try {
      final List users = await http
          .get(usersUrl, headers: headers)
          .mapResponse((response) => jsonDecode(response.body));
      final filteredUsers = users
          .where((user) =>
              user['login'].toLowerCase().contains(query.toLowerCase()))
          .toList();
      return _fetchGithubDetailedUsers(filteredUsers);
    } on HttpException catch (e) {
      throw HttpException(e.statusCode, 'Server error');
    }
  }

  Future<List> _fetchGithubDetailedUsers(List users) async {
    try {
      List detailedUsers = [];
      for (var user in users) {
        final userName = user['login'];
        final detailedUserUrl =
            Uri.parse('https://api.github.com/users/$userName');
        await http.get(detailedUserUrl, headers: headers).mapResponse(
            (response) => detailedUsers.add(jsonDecode(response.body)));
      }
      return detailedUsers;
    } on HttpException catch (e) {
      throw HttpException(e.statusCode, 'Server error');
    }
  }
}
