import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextFormField(
                controller: emailController,
                validator: validateEmail,
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.labelLarge,
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: const InputDecoration(
                  labelText: 'Почта',
                  hintText: 'Введите свою почту',
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.labelLarge,
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                  hintText: 'Введите свой пароль',
                )),
          ),
          Container(
            padding: const EdgeInsets.only(right: 18, top: 5, bottom: 5),
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/auth/reset'),
              child: Text('Забыли пароль?', style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
          SizedBox(
            height: 40,
            width: 324,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  authCubit.login(emailController.text, passwordController.text);
                }
              },
              child: Text('Войти', style: Theme.of(context).textTheme.labelMedium),
            ),
          ),
        ],
      ),
    );
  }
}
