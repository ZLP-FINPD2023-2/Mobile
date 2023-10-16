import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
            child: TextFormField(
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.labelLarge,
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: const InputDecoration(
                  labelText: 'Имя',
                  hintText: 'Иван',
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextFormField(
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.labelLarge,
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: const InputDecoration(
                  labelText: 'Фамилия',
                  hintText: 'Иванов',
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextFormField(
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.labelLarge,
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: const InputDecoration(
                  labelText: 'Отчество',
                  hintText: 'Иванович',
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextField(
                style: Theme.of(context).textTheme.labelLarge,
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
                  hintText: '27.07.2000',
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
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
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextFormField(
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.labelLarge,
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                  hintText: 'Придумайте пароль',
                )),
          ),
          Container(
            padding: const EdgeInsets.only(left: 18, top: 5),
            alignment: Alignment.bottomLeft,
            child: Text('Минимум 8 символов',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: TextFormField(
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.labelLarge,
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: const InputDecoration(
                  labelText: 'Подтверждение пароля',
                  hintText: 'Повторите пароль',
                )),
          ),
          SizedBox(
            height: 40,
            width: 324,
            child: ElevatedButton(
                onPressed: () {},
                child: Text('Зарегистрироваться',
                    style: Theme.of(context).textTheme.labelMedium,)),
          ),
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom))
        ]),
      ),
    );
  }
}
