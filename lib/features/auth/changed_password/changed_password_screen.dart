import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 160, width: 180, child: SvgPicture.asset('assets/Stars.svg')),
      const SizedBox(
        height: 48,
      ),
      Text('Пароль изменен!', style: Theme.of(context).textTheme.titleMedium),
      const SizedBox(
        height: 16,
      ),
      Center(
        child: Text('Ваш пароль успешно изменен',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      const SizedBox(
        height: 48,
      ),
      //кнопка войти
      SizedBox(
        height: 40,
        width: 324,
        child: ElevatedButton(
              onPressed: () {},
              child: Text('Войти',
                  style: Theme.of(context).textTheme.labelMedium)),
      ),
    ]));
  }
}
