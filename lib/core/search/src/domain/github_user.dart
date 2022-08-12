import 'package:equatable/equatable.dart';

class GithubUser extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final int totalRepos;

  const GithubUser({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.totalRepos,
  });

  @override
  List<Object?> get props => [id];
}
