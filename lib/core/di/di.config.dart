// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fin_app/core/services/network/network_service.dart' as _i4;
import 'package:fin_app/core/services/network/secure_storage/secure_storage.dart'
    as _i7;
import 'package:fin_app/features/auth/data/datasources/server_auth_datasource.dart'
    as _i5;
import 'package:fin_app/features/auth/domain/models/usecases/auth_usecase.dart'
    as _i6;
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
    gh.factory<_i4.NetworkService>(() => _i4.NetworkService());
    gh.factory<_i5.ServerAuthDataSource>(() =>
        _i5.ServerAuthDataSource(networkService: gh<_i4.NetworkService>()));
    gh.factory<_i6.AuthUseCase>(() => _i6.AuthUseCase(
          serverAuthDataSource: gh<_i5.ServerAuthDataSource>(),
          secureStorage: gh<_i3.FlutterSecureStorage>(),
        ));
    return this;
  }
}

class _$SecureStorage extends _i7.SecureStorage {}
