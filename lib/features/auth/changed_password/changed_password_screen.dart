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
      const Text('Пароль изменен!',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          )),
      const SizedBox(
        height: 16,
      ),
      const Center(
        child: Text('Ваш пароль успешно изменен',
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
            style: TextButton.styleFrom(
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
    ]));
  }
}
