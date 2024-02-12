import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';

import '../../../../../routes.dart';

class ConfirmResetPasswordScreen extends StatelessWidget {
  const ConfirmResetPasswordScreen({super.key});

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
                'Сброс пароля',
                style: context.textStyles.headlineLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              Text(
                'Придумайте новый пароль',
                style: context.textStyles.bodyLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 24,
              ),
              //? Текстовое поле Новый пароль
              TextFormField(
                textInputAction: TextInputAction.next,
                cursorColor: context.colors.outline,
                textAlign: TextAlign.justify,
                decoration: authTheme.copyWith(
                  labelText: 'Новый пароль',
                  hintText: 'Введите пароль',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 2, top: 5),
                child: Text(
                  'Минимум 8 символов',
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 24),
              //? Текстовое поле Подтвердите новый пароль
              TextFormField(
                textInputAction: TextInputAction.next,
                cursorColor: context.colors.outline,
                textAlign: TextAlign.justify,
                decoration: authTheme.copyWith(
                  labelText: 'Подтвердите новый пароль',
                  hintText: 'Повторите пароль',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Вспомнили свой пароль?'),
                  TextButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(Routes.startScreen),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AuthScreen(initialIndex: 1),
                        ),
                      );
                    },
                    child: const Text('Войти'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              //кнопка сохранить
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(Routes.changePasswordScreen),
                  child: const Text('Сохранить'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
