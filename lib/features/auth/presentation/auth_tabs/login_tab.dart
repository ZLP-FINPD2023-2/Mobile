import 'package:flutter/material.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: TextFormField(
              obscureText: true,
              autocorrect: false,
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
          child: ElevatedButton(onPressed: () {}, child: Text('Войти', style: Theme.of(context).textTheme.labelMedium)),
        ),
      ],
    );
  }
}
