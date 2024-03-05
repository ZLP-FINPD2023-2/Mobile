import 'package:fin_app/core/di/di.dart';
import 'package:fin_app/core/logger/logger.dart';
import 'package:fin_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:fin_app/features/goals/domain/usecases/goals_usecase.dart';
import 'package:fin_app/features/goals/presentation/cubit/goals_cubit.dart';
import 'package:fin_app/features/transactions/domain/models/usecases/transactions_usecase.dart';
import 'package:fin_app/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  confingureDependecies();

  String initialRoute = await getInitialRoute();

  runApp(MainApp(initialRoute: initialRoute));
}

Future<String> getInitialRoute() async {
  final storage = getIt<FlutterSecureStorage>();
  String? token = await storage.read(key: 'token');
  logger.debug("Token $token");
  return token != null && token.isNotEmpty ? Routes.homeScreen : Routes.startScreen;
}

class MainApp extends StatelessWidget {
  final String initialRoute;

  const MainApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    final child = MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: routes,
      theme: appTheme,
    );

    return BlocProvider(
      create: (_) => AuthCubit(getIt<AuthUseCase>()),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: () => MultiBlocProvider(
              providers: [
                BlocProvider<GoalsCubit>(
                  create: (_) => GoalsCubit(getIt<GoalsUseCase>()),
                ),
                BlocProvider<TransactionsCubit>(
                  create: (_) => TransactionsCubit(getIt<TransactionsUseCase>()),
                ),
              ],
              child: child,
            ),
            orElse: () => child,
          );
        },
      ),
    );
  }
}
