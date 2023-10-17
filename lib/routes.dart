import 'package:fin_app/features/auth/presentation/auth_screen.dart';
import 'package:fin_app/features/auth/presentation/confirm_email/confirm_email_screen.dart';
import 'package:fin_app/features/auth/presentation/confirm_reset_password/confirm_reset_password_screen.dart';
import 'package:fin_app/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:fin_app/features/start/start_screen.dart';
import 'package:fin_app/features/auth/presentation/changed_password/changed_password_screen.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/placeholder_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const StartScreen(),
  '/auth': (context) => const AuthScreen(),
  '/auth/confirm_email': (context) => const ConfirmEmailScreen(),
  '/auth/reset': (context) => const ResetPasswordScreen(),
  '/auth/reset/confirm': (context) => const ConfirmResetPasswordScreen(),
  '/auth/reset/confirm/changed': (context) => const ChangePasswordScreen(),
  '/placeholder': (context) => PlaceholderScreen(),
};
