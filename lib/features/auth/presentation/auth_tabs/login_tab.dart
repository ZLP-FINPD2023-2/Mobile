import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_app/constants/theme.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool _obscurePassword = true;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Введите корректный адрес электронной почты';
    }
    return null;
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
            TextFormField(
              controller: emailController,
              validator: validateEmail,
              textInputAction: TextInputAction.next,
              cursorColor: context.colors.outline,
              textAlign: TextAlign.justify,
              decoration: authTheme.copyWith(
                labelText: 'Почта',
                hintText: 'Введите свою почту',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.next,
              obscureText: _obscurePassword,
              autocorrect: false,
              cursorColor: context.colors.outline,
              textAlign: TextAlign.justify,
              decoration: authTheme.copyWith(
                labelText: 'Пароль',
                hintText: 'Введите свой пароль',
                suffixIcon: InkWell(
                  onTap: () => setState(() {
                    _obscurePassword = !_obscurePassword;
                  }),
                  child: const Icon(
                    size: 24,
                    Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () => {},
                child: const Text(
                  'Забыли пароль?',
                ),
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const SizedBox(height: 40, width: 40, child: CircularProgressIndicator());
                }
                return SizedBox(
                  height: 40,
                  width: 324,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authCubit.login(emailController.text, passwordController.text);
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
