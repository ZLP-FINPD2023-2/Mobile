import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_app/core/di/di.dart';
import '../domain/models/usecases/auth_usecase.dart';

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
          create: (context) => AuthCubit(getIt<AuthUseCase>()),
          child: DefaultTabController(
            initialIndex: initialIndex,
            length: 2,
            child: Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                TabBar(tabs: [
                  Tab(
                    child: Text(
                      'Регистрация',
                    ),
                  ),
                  Tab(
                    child: Text('Вход'),
                  )
                ]),
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
                          .pushReplacementNamed('/placeholder');
                    }
                  },
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      print('Current AuthState: $state');
                      if (state is AuthLoadingState) {
                        return const CircularProgressIndicator();
                      } else if (state is AuthErrorState) {
                        return Text(state.error);
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
