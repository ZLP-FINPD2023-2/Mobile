import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/auth_cubit.dart';
import '../../../core/cubit/auth_cubit_states.dart';
import '../../../core/di/di.dart';
import '../../../core/services/network/network_service.dart';
import 'auth_tabs/login_tab.dart';
import 'auth_tabs/registration_tab.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = AuthCubit(getIt<NetworkService>());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => _authCubit,
          child: DefaultTabController(
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
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Tab(
                    child: Text('Вход', style: Theme.of(context).textTheme.labelSmall),
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
                      Navigator.of(context).pushReplacementNamed('/placeholder');
                    }
                  },
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      print('Current AuthState: $state');
                      if (state is AuthLoadingState) {
                        return CircularProgressIndicator();
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

  @override
  void dispose() {
    _authCubit.close();
    super.dispose();
  }
}
