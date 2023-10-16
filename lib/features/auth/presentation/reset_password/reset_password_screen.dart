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
          child: Text('Забыли пароль?', style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.bottomLeft,
          child: Text('Укажите адрес электронной почты,',
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.bottomLeft,
          child: Text('связанный с вашей учетной записью,',
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.bottomLeft,
          child: Text('для восстановления пароля.',
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(
          height: 32,
        ),
        //? Текстовое поле Почта
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: TextFormField(
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
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Помните пароль?', style: Theme.of(context).textTheme.bodySmall),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Войти', style: Theme.of(context).textTheme.bodyLarge))
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
              onPressed: () => Navigator.of(context).pushNamed('/auth/confirm_email'),
              child: Text('Прислать код', style: Theme.of(context).textTheme.labelMedium)),
        ),
      ])),
    );
  }
}
