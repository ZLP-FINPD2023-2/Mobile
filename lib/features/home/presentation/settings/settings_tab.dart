import 'package:fin_app/core/di/di.dart';
import 'package:fin_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:fin_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthUseCase>()),
      child: Center(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthInitialState) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.startScreen,
                (route) => false,
              );
            }
          },
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return TextButton(
                onPressed: () => context.read<AuthCubit>().logout(),
                child: const Text('Выйти'),
              );
            },
          ),
        ),
      ),
    );
  }
}
