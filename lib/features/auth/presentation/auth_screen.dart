import 'package:fin_app/core/logger/logger.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_app/core/di/di.dart';

import '../../../routes.dart';
import 'auth_tabs/login_tab.dart';
import 'auth_tabs/registration_tab.dart';

class AuthScreen extends StatelessWidget {
  final int initialIndex;

  const AuthScreen({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: DefaultTabController(
            initialIndex: initialIndex,
            length: 2,
            child: Column(
              children: [
                const SizedBox(height: 14),
                const TabBar(
                  tabs: [
                    Tab(child: Text('Регистрация')),
                    Tab(child: Text('Вход')),
                  ],
                ),
                const Expanded(
                  flex: 2,
                  child: TabBarView(
                    children: [
                      RegistrationTab(),
                      LoginTab(),
                    ],
                  ),
                ),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccessState) {
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.homeScreen);
                    }
                  },
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      logger.debug('Current AuthState: $state');
                      if (state is AuthLoadingState) {
                        return const CircularProgressIndicator();
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
