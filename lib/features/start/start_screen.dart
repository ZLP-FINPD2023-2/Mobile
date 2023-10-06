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
    return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
        const SizedBox(
          height: 48,
        ),
        SizedBox(
            height: 160,
            width: 180,
            child: SvgPicture.asset('assets/Illustration.svg')),
        const SizedBox(
          height: 48,
        ),
        const Text('Добро пожаловать!',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            )),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
              'Теперь ваши финансы находятся \n в одном месте и всегда под контролем',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff6B7280),
              )),
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
              style: ElevatedButton.styleFrom(

                  backgroundColor: const Color(0xff0F172A),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
              child: const Text('Войти',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ))),
        ),
        const SizedBox(
          height: 24,
        ),
        //кнопка зарегистрироваться
        SizedBox(
          height: 40,
          width: 324,
          child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xff94A3B8)),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
              child: const Text('Зарегистрироваться',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ))),
        ),
      ]));
  }
}
