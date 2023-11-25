import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';

class ConfirmEmailScreen extends StatelessWidget {
  const ConfirmEmailScreen({super.key});

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
                'Проверьте вашу почту',
                style: context.textStyles.headlineLarge,
              ),
              const SizedBox(height: 24),
              Text(
                'Мы отправили код на адрес: ',
                textAlign: TextAlign.start,
                style: context.textStyles.bodyLarge,
              ),
              Text(
                'helloworld@gmail.com ',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 48),
              //? Текстовое поле Код
              TextFormField(
                textInputAction: TextInputAction.next,
                cursorColor: context.colors.outline,
                textAlign: TextAlign.justify,
                decoration: authTheme.copyWith(
                  labelText: 'Код',
                  hintText: 'Введите код',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Отправить код заново:'),
                  ),
                  const Text('00:20')
                ],
              ),
              const SizedBox(height: 24),
              //кнопка подтвердить
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                    Routes.confirmResetPasswordScreen,
                  ),
                  child: const Text('Подтвердить'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
