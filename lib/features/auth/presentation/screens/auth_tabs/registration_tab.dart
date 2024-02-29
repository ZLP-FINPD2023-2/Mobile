import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/auth/domain/models/user.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/auth/presentation/cubit/auth_cubit_state.dart';
import 'package:fin_app/features/auth/presentation/widgets/email_input.dart';
import 'package:fin_app/features/auth/presentation/widgets/password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:intl/intl.dart';

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
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Gender genderSelected = Gender.male;
  bool _obsecurePassword = true;

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
              _BirthdayInput(
                onChangedCallback: (date) => setState(() {
                  birthdayController.text = DateFormat('dd.MM.yyyy').format(date);
                }),
                controller: birthdayController,
              ),
              const SizedBox(height: 20),
              _GenderDropdownInput(
                onChangedCallback: (newValue) => setState(() {
                  if (newValue != null) {
                    genderSelected = newValue;
                  }
                }),
              ),
              const SizedBox(height: 20),
              EmailInput(
                controller: emailController,
              ),
              const SizedBox(height: 20),
              PasswordInput(
                needValidation: true,
                controller: passwordController,
                isObsecurePassword: _obsecurePassword,
                onVisibleChanged: () => setState(() {
                  _obsecurePassword = !_obsecurePassword;
                }),
                hintText: 'Придумайте пароль',
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
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
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  // TODO: maybe cancel loading during change tab
                  if (state is AuthLoadingState) {
                    return const SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox(
                    height: 40,
                    width: 324,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          authCubit.register(
                            name: nameController.text,
                            surname: surnameController.text,
                            patronymic: patronymicController.text,
                            birthday: birthdayController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            gender: genderSelected,
                          );
                        }
                      },
                      child: const Text('Зарегистрироваться'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    surnameController.dispose();
    patronymicController.dispose();
    birthdayController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}

class _GenderDropdownInput extends StatelessWidget {
  final void Function(Gender? gender) onChangedCallback;

  const _GenderDropdownInput({
    required this.onChangedCallback,
  });

  @override
  Widget build(BuildContext context) {
    final Map<Gender, String> menuValues = {
      Gender.female: 'Женский',
      Gender.male: 'Мужской',
    };

    return DropdownButtonFormField(
      decoration: authTheme.copyWith(labelText: 'Пол', hintText: 'Ваш пол'),
      items: Gender.values.toList().map<DropdownMenuItem<Gender>>((value) {
        return DropdownMenuItem<Gender>(
          value: value,
          child: Text(
            menuValues[value] ?? '',
            style: const TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
      onChanged: onChangedCallback,
    );
  }
}

class _BirthdayInput extends StatelessWidget {
  final void Function(DateTime data) onChangedCallback;
  final TextEditingController controller;

  const _BirthdayInput({
    required this.onChangedCallback,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: TextFormField(
        enabled: false,
        controller: controller, // Добавьте эту строку
        style: TextStyle(
          color: context.colors.onSurface,
        ),
        cursorColor: context.colors.outline,
        textAlign: TextAlign.justify,
        decoration: authTheme.copyWith(
          labelText: 'Дата рождения',
          hintText: '27.07.2000',
          suffixIcon: const Icon(
            size: 24,
            Icons.today_rounded,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  void _pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      onChangedCallback(date);
    }
  }
}
