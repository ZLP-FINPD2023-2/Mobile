import 'package:fin_app/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';

import '../../../../../routes.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Забыли пароль?',
                style: context.textStyles.headlineLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              Text(
                'Укажите адрес электронной почты,',
                style: context.textStyles.bodyLarge,
                textAlign: TextAlign.start,
              ),
              Text(
                'связанный с вашей учетной записью,',
                style: context.textStyles.bodyLarge,
                textAlign: TextAlign.start,
              ),
              Text(
                'для восстановления пароля.',
                style: context.textStyles.bodyLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 32),
              //? Текстовое поле Почта
              TextFormField(
                textInputAction: TextInputAction.next,
                cursorColor: context.colors.outline,
                textAlign: TextAlign.justify,
                decoration: authTheme.copyWith(
                  labelText: 'Почта',
                  hintText: 'Введите свою почту',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Помните пароль?'),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Войти'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              //кнопка прислать код
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(Routes.confirmEmailScreen),
                  child: const Text('Прислать код'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
