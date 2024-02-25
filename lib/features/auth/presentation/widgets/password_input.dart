import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final VoidCallback onVisibleChanged;
  final bool isObsecurePassword;
  final TextEditingController controller;
  final bool needValidation;
  final String hintText;

  const PasswordInput({
    super.key,
    required this.onVisibleChanged,
    required this.isObsecurePassword,
    required this.controller,
    required this.hintText,
    this.needValidation = false,
  });

  String? validatePasswordLength(String? value) {
    if (value == null || value.length < 8) {
      return 'Пароль должен содержать минимум 8 символов';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecurePassword,
      controller: controller,
      validator: needValidation ? validatePasswordLength : null,
      textInputAction: TextInputAction.next,
      cursorColor: context.colors.outline,
      textAlign: TextAlign.justify,
      autocorrect: false,
      decoration: authTheme.copyWith(
        labelText: 'Пароль',
        hintText: hintText,
        suffixIcon: InkWell(
          onTap: onVisibleChanged,
          child: const Icon(
            size: 24,
            Icons.visibility,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
