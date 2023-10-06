import 'package:flutter/material.dart';
import 'registration_tab_model.dart';

class RegistrationTab extends StatefulWidget {
  const RegistrationTab({super.key});

  @override
  State<RegistrationTab> createState() => _RegistrationTab();
}

class _RegistrationTab extends State<RegistrationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextFormField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                    labelText: 'Имя',
                    labelStyle: const TextStyle(
                        color: Color(0xff4B5563),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    hintText: 'Иван',
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
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextFormField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                    labelText: 'Фамилия',
                    labelStyle: const TextStyle(
                        color: Color(0xff4B5563),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    hintText: 'Иванов',
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
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextFormField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                    labelText: 'Отчество',
                    labelStyle: const TextStyle(
                        color: Color(0xff4B5563),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    hintText: 'Иванович',
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
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextField(
                //onTap: () => RegisterModel.setDate(context), не понимаю как надо подсоединить тут календарь
                controller: RegisterModel().dateController,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                    suffixIconConstraints: const BoxConstraints(maxHeight: 24),
                    suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 24,
                        icon: const Icon(
                          Icons.today_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {}),
                    labelText: 'Дата рождения',
                    labelStyle: const TextStyle(
                        color: Color(0xff4B5563),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    hintText: '27.07.2000',
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
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
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
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
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
                    hintText: 'Придумайте пароль',
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: TextFormField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                    labelText: 'Подтверждение пароля',
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
                child: const Text('Зарегистрироваться',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ))),
          ),
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom))
        ]),
      ),
    );
  }
}
