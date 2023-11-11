import 'package:fin_app/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../routes.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
              width: 180,
              child: SvgPicture.asset('assets/Stars.svg'),
            ),
            const SizedBox(height: 48),
            Text(
              'Пароль изменен!',
              style: context.textStyles.headlineLarge,
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Ваш пароль успешно изменен',
                style: context.textStyles.bodyLarge,
              ),
            ),
            const SizedBox(height: 48),
            //кнопка войти
            SizedBox(
              height: 40,
              width: 324,
              child: ElevatedButton(
                onPressed: () => Navigator.popUntil(
                  context,
                  ModalRoute.withName(Routes.authScreen),
                ),
                child: const Text('Войти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
