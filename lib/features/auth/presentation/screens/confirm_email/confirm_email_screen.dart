import 'dart:async';

import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({super.key});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  final String email = 'helloworld@gmail.com';

  late final TextEditingController confirmationCodeController;
  late final Timer requestConfirmationCodeTimer;

  Duration requestConfirmationCodeTime = const Duration(seconds: 20);

  @override
  void initState() {
    super.initState();
    confirmationCodeController = TextEditingController();
    requestConfirmationCodeTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (mounted) {
          setState(
            () {
              if (requestConfirmationCodeTime.inSeconds > 0) {
                requestConfirmationCodeTime = Duration(
                  seconds: requestConfirmationCodeTime.inSeconds - 1,
                );
              }
            },
          );
        }
      },
    );
  }

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
                'Мы отправили код на адрес:',
                textAlign: TextAlign.start,
                style: context.textStyles.bodyLarge,
              ),
              Text(
                email,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 48),
              TextFormField(
                controller: confirmationCodeController,
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
                  Text(
                    '${(requestConfirmationCodeTime.inSeconds / 60).floor()}:${requestConfirmationCodeTime.inSeconds % 60}',
                  ),
                ],
              ),
              const SizedBox(height: 24),
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

  @override
  void dispose() {
    super.dispose();
    confirmationCodeController.dispose();
    requestConfirmationCodeTimer.cancel();
  }
}
