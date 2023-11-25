import 'package:fin_app/features/auth/presentation/auth_screen.dart';
import 'package:fin_app/features/auth/presentation/confirm_email/confirm_email_screen.dart';
import 'package:fin_app/features/auth/presentation/confirm_reset_password/confirm_reset_password_screen.dart';
import 'package:fin_app/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:fin_app/features/home/presentation/home_screen.dart';
import 'package:fin_app/features/start/start_screen.dart';
import 'package:fin_app/features/auth/presentation/changed_password/changed_password_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Routes.startScreen: (context) => const StartScreen(),
  Routes.authScreen: (context) => const AuthScreen(initialIndex: 1),
  Routes.confirmEmailScreen: (context) => const ConfirmEmailScreen(),
  Routes.resetPasswordScreen: (context) => const ResetPasswordScreen(),
  Routes.confirmResetPasswordScreen: (context) =>
      const ConfirmResetPasswordScreen(),
  Routes.changePasswordScreen: (context) => const ChangePasswordScreen(),
  Routes.homeScreen: (context) => const HomeScreen(),
};

class Routes {
  static String startScreen = '/';

  static String authScreen = '/auth';

  static String confirmEmailScreen = '/auth/confirm_email';

  static String resetPasswordScreen = '/auth/reset';

  static String confirmResetPasswordScreen = '/auth/reset/confirm';

  static String changePasswordScreen = '/auth/reset/confirm/changed';

  static String homeScreen = '/home';
}
