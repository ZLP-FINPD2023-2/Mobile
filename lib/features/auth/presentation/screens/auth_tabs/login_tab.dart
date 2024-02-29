import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:fin_app/features/auth/presentation/widgets/email_input.dart';
import 'package:fin_app/features/auth/presentation/widgets/password_input.dart';
import 'package:fin_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool _obsecurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailInput(
              controller: emailController,
            ),
            const SizedBox(height: 12),
            PasswordInput(
              controller: passwordController,
              isObsecurePassword: _obsecurePassword,
              onVisibleChanged: () => setState(() {
                _obsecurePassword = !_obsecurePassword;
              }),
              hintText: 'Введите свой пароль',
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () => Navigator.of(context).pushNamed(Routes.resetPasswordScreen),
                child: const Text(
                  'Забыли пароль?',
                ),
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  // TODO: maybe cancel loading during change tab
                  return const SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 40,
                  width: 324,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        authCubit.login(
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                    child: const Text('Войти'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
