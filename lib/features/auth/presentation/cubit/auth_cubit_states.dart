import 'package:fin_app/core/flutter_core.dart';


abstract class AuthState extends AppState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
}

class AuthSuccessState extends AuthState {}