import 'package:flutter/material.dart';

class ConfirmResetPasswordScreen extends StatefulWidget {
  const ConfirmResetPasswordScreen({super.key});

  @override
  State<ConfirmResetPasswordScreen> createState() =>
      _ConfirmResetPasswordScreenState();
}

class _ConfirmResetPasswordScreenState
    extends State<ConfirmResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: const EdgeInsets.only(left: 15),
        alignment: Alignment.bottomLeft,
        child: const Text('Сброс пароля',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            )),
      ),
      const SizedBox(
        height: 24,
      ),
      Container(
        padding: const EdgeInsets.only(left: 16),
        alignment: Alignment.bottomLeft,
        child: const Text('Придумайте новый пароль',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff6B7280),
            )),
      ),
      const SizedBox(
        height: 24,
      ),
      //? Текстовое поле Новый пароль
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
                labelText: 'Новый пароль',
                labelStyle: const TextStyle(
                    color: Color(0xff4B5563),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                hintText: 'Введите пароль',
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
        padding: const EdgeInsets.only(left: 18, top: 5),
        alignment: Alignment.bottomLeft,
        child: const Text('Минимум 8 символов',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff6B7280),
            )),
      ),
      const SizedBox(
        height: 24,
      ),
      //? Текстовое поле Подтвердите новый пароль
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
                labelText: 'Подтвердите новый пароль',
                labelStyle: const TextStyle(
                    color: Color(0xff4B5563),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                hintText: 'Повторите пароль',
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
      Padding(padding: const EdgeInsets.only(right: 16),child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('У вас уже есть учётная запись?',
              style: TextStyle(color: Color(0xff94A3B8), fontSize: 14)),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Войти',
                style: TextStyle(
                  color: Color(0xff64748B),
                  fontSize: 14,
                ),
              ))
        ],
      ),),
      const SizedBox(
        height: 12,
      ),
      //кнопка сохранить
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
            child: const Text('Сохранить',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ))),
      ),
    ]));
  }
}
