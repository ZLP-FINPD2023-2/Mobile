import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/auth/presentation/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            SizedBox(
              height: 160,
              width: 180,
              child: SvgPicture.asset('assets/Illustration.svg'),
            ),
            const SizedBox(height: 48),
            Text(
              'Добро пожаловать!',
              style: context.textStyles.headlineLarge,
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Теперь ваши финансы находятся\nв одном месте и всегда под контролем',
                style: context.textStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
            //кнопка войти
            SizedBox(
              height: 40,
              width: 324,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(
                      initialIndex: 1,
                    ),
                  ),
                ),
                child: const Text('Войти'),
              ),
            ),
            const SizedBox(height: 24),
            //кнопка зарегистрироваться
            SizedBox(
              height: 40,
              width: 324,
              child: OutlinedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(
                      initialIndex: 0,
                    ),
                  ),
                ),
                child: const Text('Зарегистрироваться'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
