import 'package:flutter/material.dart';

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({super.key});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.only(left: 18),
          alignment: Alignment.bottomLeft,
          child: Text('Проверьте вашу почту', style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.bottomLeft,
          child: Text('Мы отправили код на адрес: ',
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 19),
            child: const Text('helloworld@gmail.com ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff6B7280),
                  fontWeight: FontWeight.w700,
                ))),
        const SizedBox(
          height: 48,
        ),
        //? Текстовое поле Код
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: TextFormField(
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.labelLarge,
              cursorColor: const Color(0xff94A3B8),
              textAlign: TextAlign.justify,
              decoration: const InputDecoration(
                labelText: 'Код',
                hintText: 'Введите код',
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {}, child: Text('Отправить код заново:', style: Theme.of(context).textTheme.bodyLarge)),
              Text('00:20', style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //кнопка подтвердить
        SizedBox(
          height: 40,
          width: 324,
          child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/auth/reset/confirm'),
              child: Text('Подтвердить', style: Theme.of(context).textTheme.labelMedium)),
        ),
      ])),
    );
  }
}
