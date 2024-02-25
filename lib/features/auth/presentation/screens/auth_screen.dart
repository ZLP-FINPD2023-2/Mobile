import 'package:fin_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../routes.dart';
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
    final tabs = {
      'Регистрация': const RegistrationTab(),
      'Вход': const LoginTab(),
    };

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (context) => AuthCubit(getIt<AuthUseCase>()),
            child: DefaultTabController(
              initialIndex: initialIndex,
              length: tabs.length,
              child: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      const SizedBox(height: 14),
                      TabBar(
                        tabs: tabs.keys.map((title) => Text(title)).toList(),
                      ),
                      Expanded(
                        flex: 2,
                        child: TabBarView(
                          children: tabs.values.toList(),
                        ),
                      ),
                      BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccessState) {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.homeScreen);
                          }
                        },
                        child: Container(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
