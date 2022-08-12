import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_github_users/dependency_injection/dependency_injection.dart';
import 'package:search_github_users/presentation/pages/search_page/bloc/search_page_bloc.dart';
import 'package:search_github_users/presentation/pages/search_page/search_page.dart';

import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.searchPage:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (context) => sl<SearchPageBloc>(),
            child: const SearchPage(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings,
    Widget page,
  ) =>
      MaterialPageRoute(settings: settings, builder: (context) => page);

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('ERROR')),
      ),
    );
  }
}
