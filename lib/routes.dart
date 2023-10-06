import 'package:fin_app/features/auth/auth_screen.dart';
import 'package:fin_app/features/auth/confirm_email/confirm_email_screen.dart';
import 'package:fin_app/features/auth/confirm_reset_password/confirm_reset_password_screen.dart';
import 'package:fin_app/features/auth/reset_password/reset_password_screen.dart';
import 'package:fin_app/features/start/start_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const StartScreen(),
  '/auth': (context) => const AuthScreen(),
  '/auth/confirm_email': (context) => const ConfirmEmailScreen(),
  '/auth/reset': (context) => const ResetPasswordScreen(),
  '/auth/reset/confirm': (context) => const ConfirmResetPasswordScreen(),
};