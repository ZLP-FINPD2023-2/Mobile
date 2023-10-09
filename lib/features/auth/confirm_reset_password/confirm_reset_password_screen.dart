import 'package:flutter/material.dart';

class ConfirmResetPasswordScreen extends StatefulWidget {
  const ConfirmResetPasswordScreen({super.key});

  @override
  State<ConfirmResetPasswordScreen> createState() => _ConfirmResetPasswordScreenState();
}

class _ConfirmResetPasswordScreenState extends State<ConfirmResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.bottomLeft,
          child: Text('Сброс пароля', style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.bottomLeft,
          child: Text('Придумайте новый пароль',
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(
          height: 24,
        ),
        //? Текстовое поле Новый пароль
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: TextFormField(
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.labelLarge,
              cursorColor: const Color(0xff94A3B8),
              textAlign: TextAlign.justify,
              decoration: const InputDecoration(
                labelText: 'Новый пароль',
                hintText: 'Введите пароль',
              )),
        ),
        Container(
          padding: const EdgeInsets.only(left: 18, top: 5),
          alignment: Alignment.bottomLeft,
          child: Text('Минимум 8 символов', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
        ),
        const SizedBox(
          height: 24,
        ),
        //? Текстовое поле Подтвердите новый пароль
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: TextFormField(
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.labelLarge,
              cursorColor: const Color(0xff94A3B8),
              textAlign: TextAlign.justify,
              decoration: const InputDecoration(
                labelText: 'Подтвердите новый пароль',
                hintText: 'Повторите пароль',
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Вспомнили свой пароль?', style: Theme.of(context).textTheme.bodySmall),
              TextButton(
                  onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/auth')),
                  child: Text('Войти', style: Theme.of(context).textTheme.bodyLarge))
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        //кнопка сохранить
        SizedBox(
          height: 40,
          width: 324,
          child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/auth/reset/confirm/changed'),
              child: Text('Сохранить', style: Theme.of(context).textTheme.labelMedium)),
        ),
      ])),
    );
  }
}
