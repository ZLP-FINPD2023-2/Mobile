import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Gender { male, female }

class RegistrationTab extends StatefulWidget {
  const RegistrationTab({super.key});

  @override
  _RegistrationTabState createState() => _RegistrationTabState();
}

class _RegistrationTabState extends State<RegistrationTab> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController patronymicController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  Gender genderSelected = Gender.male;
  final Map<Gender, String> menuValues = {
    Gender.female: 'Женский',
    Gender.male: 'Мужской',
  };

  String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Введите корректный адрес электронной почты';
    }
    return null;
  }

  String? validatePasswordLength(String? value) {
    if (value == null || value.length < 8) {
      return 'Пароль должен содержать минимум 8 символов';
    }
    return null;
  }

  String? validatePasswordMatch(String? value) {
    if (value != passwordController.text) {
      return 'Пароли не совпадают';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: false,
      child: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
            child: TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
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
                controller: surnameController,
                textInputAction: TextInputAction.next,
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
                controller: patronymicController,
                textInputAction: TextInputAction.next,
                cursorColor: const Color(0xff94A3B8),
                textAlign: TextAlign.justify,
                decoration: const InputDecoration(
                  labelText: 'Отчество',
                  hintText: 'Иванович',
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: GestureDetector(
              onTap: () => _pickDate(),
              child: TextFormField(
                  enabled: false,
                  controller: birthDateController, // Добавьте эту строку
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
          ),
          DropdownButton(
            value: genderSelected,
            items: Gender.values.toList().map<DropdownMenuItem<Gender>>((Gender value) {
              return DropdownMenuItem<Gender>(
                value: value,
                child: Text(menuValues[value] ?? '', style: const TextStyle(fontSize: 16)),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                genderSelected = newValue!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextFormField(
                controller: emailController,
                validator: validateEmail,
                textInputAction: TextInputAction.next,
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
                controller: passwordController,
                validator: validatePasswordLength,
                textInputAction: TextInputAction.next,
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
            child: const Text(
              'Минимум 8 символов',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: TextFormField(
                controller: confirmPasswordController,
                validator: validatePasswordMatch,
                textInputAction: TextInputAction.next,
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  authCubit.register(
                      name: nameController.text,
                      surname: surnameController.text,
                      patronymic: patronymicController.text,
                      birthDate: birthDateController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      gender: genderSelected
                      // confirmPassword: confirmPasswordController.text,
                      );
                }
              },
              child: const Text('Зарегистрироваться'),
            ),
          ),
        ]),
      ),
    );
  }

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        birthDateController.text = date.toString().split(' ')[0];
      });
    }
  }
}
