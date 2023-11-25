import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_app/constants/theme.dart';

enum Gender { male, female }

class RegistrationTab extends StatefulWidget {
  const RegistrationTab({super.key});

  @override
  State<RegistrationTab> createState() => _RegistrationTabState();
}

class _RegistrationTabState extends State<RegistrationTab> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController patronymicController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 25),
              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                cursorColor: context.colors.outline,
                textAlign: TextAlign.justify,
                decoration: authTheme.copyWith(
                  labelText: 'Имя',
                  hintText: 'Иван',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: surnameController,
                textInputAction: TextInputAction.next,
                cursorColor: context.colors.outline,
                textAlign: TextAlign.justify,
                decoration: authTheme.copyWith(
                  labelText: 'Фамилия',
                  hintText: 'Иванов',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: patronymicController,
                textInputAction: TextInputAction.next,
                cursorColor: context.colors.outline,
                textAlign: TextAlign.justify,
                decoration: authTheme.copyWith(
                  labelText: 'Отчество',
                  hintText: 'Иванович',
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _pickDate(),
                child: TextFormField(
                  enabled: false,
                  controller: birthDateController, // Добавьте эту строку
                  style: context.textStyles.labelLarge,
                  cursorColor: context.colors.outline,
                  textAlign: TextAlign.justify,
                  decoration: authTheme.copyWith(
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
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                decoration:
                    authTheme.copyWith(labelText: 'Пол', hintText: 'Ваш пол'),
                items: Gender.values
                    .toList()
                    .map<DropdownMenuItem<Gender>>((Gender value) {
                  return DropdownMenuItem<Gender>(
                    value: value,
                    child: Text(menuValues[value] ?? '',
                        style: const TextStyle(fontSize: 16)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    genderSelected = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                validator: validateEmail,
                textInputAction: TextInputAction.next,
                cursorColor: context.colors.outline,
                textAlign: TextAlign.justify,
                decoration: authTheme.copyWith(
                  labelText: 'Почта',
                  hintText: 'Введите свою почту',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                  controller: passwordController,
                  validator: validatePasswordLength,
                  textInputAction: TextInputAction.next,
                  cursorColor: const Color(0xff94A3B8),
                  textAlign: TextAlign.justify,
                  decoration: authTheme.copyWith(
                    labelText: 'Пароль',
                    hintText: 'Придумайте пароль',
                  )),
              const SizedBox(height: 20),
              TextFormField(
                controller: confirmPasswordController,
                validator: validatePasswordMatch,
                textInputAction: TextInputAction.next,
                cursorColor: context.colors.outline,
                textAlign: TextAlign.justify,
                decoration: authTheme.copyWith(
                  labelText: 'Подтверждение пароля',
                  hintText: 'Повторите пароль',
                ),
              ),
              const SizedBox(height: 20),
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
                        gender: genderSelected,
                      );
                    }
                  },
                  child: const Text('Зарегистрироваться'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
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

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    surnameController.dispose();
    patronymicController.dispose();
    birthDateController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
