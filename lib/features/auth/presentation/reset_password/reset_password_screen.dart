import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.only(left: 14),
          alignment: Alignment.bottomLeft,
          child: Text('Забыли пароль?',
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Укажите адрес электронной почты,',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.bottomLeft,
          child: Text(
            'связанный с вашей учетной записью,',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.bottomLeft,
          child: Text(
            'для восстановления пароля.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        //? Текстовое поле Почта
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: const Color(0xff94A3B8),
              textAlign: TextAlign.justify,
              decoration: const InputDecoration(
                labelText: 'Почта',
                hintText: 'Введите свою почту',
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Помните пароль?'),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Войти'))
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //кнопка прислать код
        SizedBox(
          height: 40,
          width: 324,
          child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/auth/confirm_email'),
              child: const Text('Прислать код')),
        ),
      ])),
    );
  }
}
