import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routes.dart';
import 'auth_tabs/login_tab.dart';
import 'auth_tabs/registration_tab.dart';

class AuthScreen extends StatelessWidget {
  final int initialIndex;

  const AuthScreen({
    super.key,
    required this.initialIndex,
  });

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
          body: DefaultTabController(
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
                        final isAuth =
                            state.whenOrNull(success: () => true) ?? false;
                        if (isAuth) {
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
    );
  }
}
