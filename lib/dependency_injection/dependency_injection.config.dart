// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/search/application.dart' as _i9;
import '../core/search/domain.dart' as _i4;
import '../core/search/infrastructure.dart' as _i6;
import '../core/search/src/application/search_github_users.dart' as _i7;
import '../core/search/src/infrastructure/api_client.dart' as _i3;
import '../core/search/src/infrastructure/github_user_repository_impl.dart'
    as _i5;
import '../core/search/src/infrastructure/user_mapper.dart' as _i10;
import '../presentation/pages/search_page/bloc/search_page_bloc.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ApiClient>(() => _i3.ApiClient());
  gh.lazySingleton<_i4.GithubUserRepository>(() => _i5.GithubUserRepositoryImpl(
      get<_i6.ApiClient>(), get<_i6.UserMapper>()));
  gh.factory<_i7.SearchGithubUsers>(
      () => _i7.SearchGithubUsers(get<_i4.GithubUserRepository>()));
  gh.factory<_i8.SearchPageBloc>(
      () => _i8.SearchPageBloc(get<_i9.SearchGithubUsers>()));
  gh.factory<_i10.UserMapper>(() => _i10.UserMapper());
  return get;
}
