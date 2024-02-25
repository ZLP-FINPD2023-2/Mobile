import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/auth/presentation/widgets/email_input.dart';
import 'package:flutter/material.dart';

import '../../../../../routes.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
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
                'Забыли пароль?',
                style: context.textStyles.headlineLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              Text(
                'Укажите адрес электронной почты, связанный с вашей учетной записью, для восстановления пароля.',
                style: context.textStyles.bodyLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 32),
              EmailInput(controller: emailController),
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

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
