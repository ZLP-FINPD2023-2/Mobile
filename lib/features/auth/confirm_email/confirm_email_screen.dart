import 'package:flutter/material.dart';

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({super.key});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(padding: const EdgeInsets.only(left: 18),
        alignment: Alignment.bottomLeft,child: const Text('Проверьте вашу почту',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            )),),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.bottomLeft,
          child: const Text('Мы отправили код на адрес: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff6B7280),
              )),
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
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              cursorColor: const Color(0xff94A3B8),
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                labelText: 'Код',
                labelStyle: const TextStyle(color: Color(0xff4B5563),fontSize: 14,fontWeight: FontWeight.w400),
                hintText: 'Введите код',
                hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff94A3B8)),
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
        const SizedBox(
          height: 48,
        ),
        //кнопка подтвердить
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
              child: const Text('Подтвердить',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ))),
        ),
      ]));
  }
}
