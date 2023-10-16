import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 48,
        ),
        SizedBox(height: 160, width: 180, child: SvgPicture.asset('assets/Illustration.svg')),
        const SizedBox(
          height: 48,
        ),
        Text(
          'Добро пожаловать!',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'Теперь ваши финансы находятся\nв одном месте и всегда под контролем',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        //кнопка войти
        SizedBox(
          height: 40,
          width: 324,
          child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/auth'),
              child: Text(
                'Войти',
                style: Theme.of(context).textTheme.labelMedium,
              )),
        ),
        const SizedBox(
          height: 24,
        ),
        //кнопка зарегистрироваться
        SizedBox(
          height: 40,
          width: 324,
          child: OutlinedButton(
              onPressed: () => Navigator.of(context).pushNamed('/auth'),
              child: Text(
                'Зарегистрироваться',
                style: Theme.of(context).textTheme.labelSmall,
              )),
        ),
      ])),
    );
  }
}
