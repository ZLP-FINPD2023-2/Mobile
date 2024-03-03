import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/core/logger/logger.dart';
import 'package:fin_app/features/auth/domain/models/user.dart';
import 'package:fin_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:fin_app/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/app_state/app_state.dart';
import 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(
    this._authUseCase,
  ) : super(const AuthState.success());

  Future<void> login(String email, String password) async {
    try {
      emit(const AuthState.loading());

      logger.info('Sending login request...');

      await _authUseCase.signIn(email: email, password: password);

      emit(const AuthState.success());
    } catch (e) {
      final error = AppState.catchErrorHandler(e);

      logger.warning('Error during login: ${error.message}');
      emit(AuthState.error(error: e.toString()));
      _showToast(error.message.toString());
    }
  }

  Future<void> register({
    required String name,
    required String surname,
    required String patronymic,
    required String birthday,
    required String email,
    required String password,
    required Gender gender,
  }) async {
    try {
      emit(const AuthState.loading());

      await _authUseCase.signUp(
        birthday: birthday,
        email: email,
        firstname: name,
        gender: gender,
        lastname: surname,
        password: password,
        patronymic: patronymic,
      );

      await login(email, password);
    } catch (e) {
      final error = AppState.catchErrorHandler(e);

      logger.warning('Error during register: ${error.message}');
      emit(AuthState.error(error: error.toString()));
      _showToast(error.message.toString());
    }
  }

  Future<void> logout() async {
    try {
      emit(const AuthState.loading());
      await _authUseCase.logout();
      emit(const AuthState.initial());
    } catch (e) {
      final error = AppState.catchErrorHandler(e);

      logger.warning('Error during register: ${error.message}');
      emit(AuthState.error(error: e.toString()));
      _showToast(e.toString());
    }
  }

  void _showToast(String message) {
    showToast(
      message,
      gravity: ToastGravity.BOTTOM,
      timeInSec: 1,
      backgroundColor: lightColorScheme.background,
      textColor: lightColorScheme.shadow,
      fontSize: 14.0,
    );
  }
}
