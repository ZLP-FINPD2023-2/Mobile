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
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              cursorColor: const Color(0xff94A3B8),
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                  labelText: 'Почта',
                  labelStyle: const TextStyle(
                      color: Color(0xff4B5563),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  hintText: 'Введите свою почту',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff94A3B8)),
                  isDense: true,
                  focusColor: const Color(0xff1BD0B8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xffCBD5E1))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xff94A3B8))),
                  filled: true,
                  fillColor: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: TextFormField(
              textInputAction: TextInputAction.next,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              cursorColor: const Color(0xff94A3B8),
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                  labelText: 'Пароль',
                  labelStyle: const TextStyle(
                      color: Color(0xff4B5563),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  hintText: 'Введите свой пароль',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff94A3B8)),
                  isDense: true,
                  focusColor: const Color(0xff1BD0B8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xffCBD5E1))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xff94A3B8))),
                  filled: true,
                  fillColor: Colors.white)),
        ),
        Container(
          padding: const EdgeInsets.only(right: 18, top: 5,bottom: 5),
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {},
            child: const Text('Забыли пароль?',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                )),
          ),
        ),
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
      ],
    );
  }
}
