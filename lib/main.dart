import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:search_github_users/dependency_injection/dependency_injection.dart';
import 'package:search_github_users/presentation/router/app_routes.dart';
import 'package:search_github_users/presentation/router/route_generator.dart';
import 'package:search_github_users/presentation/theme/theme.dart';

Future<void> main() async {
  await configureInjection(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Github Users',
      theme: AppTheme.light,
      initialRoute: AppRoutes.searchPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
