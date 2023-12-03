// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fin_app/core/services/network/http_api/http_api.dart' as _i4;
import 'package:fin_app/core/services/network/network_service.dart' as _i5;
import 'package:fin_app/core/services/network/secure_storage/secure_storage.dart'
    as _i9;
import 'package:fin_app/features/auth/data/datasources/server_auth_datasource.dart'
    as _i6;
import 'package:fin_app/features/auth/domain/usecases/auth_usecase.dart'
    as _i7;
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart'
    as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final secureStorage = _$SecureStorage();
    gh.lazySingleton<_i3.FlutterSecureStorage>(() => secureStorage.instance);
    gh.factory<_i4.HttpAPI>(() => _i4.HttpAPI());
    gh.factory<_i5.NetworkService>(() => _i5.NetworkService());
    gh.factory<_i6.ServerAuthDataSource>(() =>
        _i6.ServerAuthDataSource(networkService: gh<_i5.NetworkService>()));
    gh.factory<_i7.AuthUseCase>(() => _i7.AuthUseCase(
          serverAuthDataSource: gh<_i6.ServerAuthDataSource>(),
          secureStorage: gh<_i3.FlutterSecureStorage>(),
        ));
    gh.singleton<_i8.AuthCubit>(_i8.AuthCubit(gh<_i7.AuthUseCase>()));
    return this;
  }
}

class _$SecureStorage extends _i9.SecureStorage {}
