import 'package:fin_app/core/di/di.config.dart';
import 'package:fin_app/features/auth/data/sharedPref/budget_repository.dart';
import 'package:fin_app/features/home/presentation/budget/cubit/budget_cubit/budget_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../env/env.dart';
import '../services/network/http_api/http_api.dart';

final getIt = GetIt.instance;

@InjectableInit()
void confingureDependecies() {
  HttpAPI.initialize(
    defaultBaseURL: Env.serverUrl,
    getAuthTokenFn: () => getIt<FlutterSecureStorage>().read(key: 'token'),
  );
  getIt.registerLazySingleton<BudgetRepository>(() => BudgetRepository());
  getIt.registerFactory<BudgetCubit>(() => BudgetCubit(getIt<BudgetRepository>()));
  getIt.init();
}

@module
abstract class RepositoryModule {
  @lazySingleton
  BudgetRepository get budgetRepository => BudgetRepository();
}

