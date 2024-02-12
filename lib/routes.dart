import 'package:fin_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:fin_app/features/auth/presentation/screens/confirm_email/confirm_email_screen.dart';
import 'package:fin_app/features/auth/presentation/screens/confirm_reset_password/confirm_reset_password_screen.dart';
import 'package:fin_app/features/auth/presentation/screens/reset_password/reset_password_screen.dart';
import 'package:fin_app/features/home/presentation/home_screen.dart';
import 'package:fin_app/features/start/start_screen.dart';
import 'package:fin_app/features/auth/presentation/screens/changed_password/changed_password_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Routes.startScreen: (context) => const StartScreen(),
  Routes.authScreen: (context) => const AuthScreen(initialIndex: 1),
  Routes.confirmEmailScreen: (context) => const ConfirmEmailScreen(),
  Routes.resetPasswordScreen: (context) => const ResetPasswordScreen(),
  Routes.confirmResetPasswordScreen: (context) => const ConfirmResetPasswordScreen(),
  Routes.changePasswordScreen: (context) => const ChangePasswordScreen(),
  Routes.homeScreen: (context) => const HomeScreen(),
};

class Routes {
  static String startScreen = '/start';

  static String authScreen = '/start/auth';

  static String confirmEmailScreen = '/start/auth/confirm_email';

  static String resetPasswordScreen = '/start/auth/reset';

  static String confirmResetPasswordScreen = '/start/auth/reset/confirm';

  static String changePasswordScreen = '/start/auth/reset/confirm/changed';

  static String homeScreen = '/home';
}
