// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fin_app/core/di/di.dart' as _i12;
import 'package:fin_app/core/services/network/http_api/http_api.dart' as _i6;
import 'package:fin_app/core/services/network/network_service.dart' as _i7;
import 'package:fin_app/core/services/network/secure_storage/secure_storage.dart' as _i13;
import 'package:fin_app/features/auth/data/datasources/server_auth_datasource.dart' as _i8;
import 'package:fin_app/features/auth/domain/usecases/auth_usecase.dart' as _i9;
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart' as _i11;
import 'package:fin_app/features/goals/presentation/cubit/goals_cubit.dart' as _i5;
import 'package:fin_app/features/home/data/sharedPref/budget_repository.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
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
    final repositoryModule = _$RepositoryModule();
    final secureStorage = _$SecureStorage();
    gh.lazySingleton<_i3.BudgetRepository>(() => repositoryModule.budgetRepository);
    gh.lazySingleton<_i4.FlutterSecureStorage>(() => secureStorage.instance);
    gh.singleton<_i5.GoalsCubit>(_i5.GoalsCubit());
    gh.factory<_i6.HttpAPI>(() => _i6.HttpAPI());
    gh.factory<_i7.NetworkService>(() => _i7.NetworkService());
    gh.factory<_i8.ServerAuthDataSource>(() => _i8.ServerAuthDataSource(networkService: gh<_i7.NetworkService>()));
    gh.factory<_i9.AuthUseCase>(() => _i9.AuthUseCase(
          serverAuthDataSource: gh<_i8.ServerAuthDataSource>(),
          secureStorage: gh<_i4.FlutterSecureStorage>(),
        ));
    gh.singleton<_i11.AuthCubit>(_i11.AuthCubit(gh<_i9.AuthUseCase>()));
    return this;
  }
}

class _$RepositoryModule extends _i12.RepositoryModule {}

class _$SecureStorage extends _i13.SecureStorage {}
