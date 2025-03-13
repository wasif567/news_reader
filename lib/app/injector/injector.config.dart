// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:reader/src/domain/core/internet_service/i_base_client.dart'
    as _i899;
import 'package:reader/src/domain/core/preference/preference.dart' as _i969;
import 'package:reader/src/domain/i_news_repo/i_news_repo.dart' as _i0;
import 'package:reader/src/infrastructure/core/internet_helper.dart' as _i686;
import 'package:reader/src/infrastructure/core/preference_helper.dart' as _i982;
import 'package:reader/src/infrastructure/core/third_party_injectable_module.dart'
    as _i995;
import 'package:reader/src/infrastructure/news_repo/news_repo.dart' as _i833;
import 'package:reader/src/presentation/viewstate/bottom_nav_viewstate.dart'
    as _i1056;
import 'package:reader/src/presentation/viewstate/news_viewstate.dart' as _i706;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPatyInjectableModule = _$ThirdPatyInjectableModule();
    gh.factory<_i1056.BottomNavViewstate>(() => _i1056.BottomNavViewstate());
    gh.lazySingleton<_i519.Client>(() => thirdPatyInjectableModule.client);
    gh.lazySingleton<_i982.PreferenceHelper>(
      () => thirdPatyInjectableModule.preferenceHelper,
    );
    gh.lazySingleton<_i969.PreferenceContracts>(() => _i982.PreferenceHelper());
    gh.lazySingleton<_i899.IBaseClient>(
      () => _i686.InternetHelper(gh<_i519.Client>()),
    );
    gh.lazySingleton<_i0.INewsRepo>(
      () => _i833.NewsRepo(gh<_i899.IBaseClient>()),
    );
    gh.factory<_i706.NewsViewstate>(
      () => _i706.NewsViewstate(gh<_i0.INewsRepo>()),
    );
    return this;
  }
}

class _$ThirdPatyInjectableModule extends _i995.ThirdPatyInjectableModule {}
