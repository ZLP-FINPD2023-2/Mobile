import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;

  const EmailInput({
    super.key,
    required this.controller,
  });

  String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Введите корректный адрес электронной почты';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validateEmail,
      textInputAction: TextInputAction.next,
      cursorColor: context.colors.outline,
      textAlign: TextAlign.justify,
      decoration: authTheme.copyWith(
        labelText: 'Почта',
        hintText: 'Введите свою почту',
      ),
    );
  }
}
