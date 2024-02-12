import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/core/logger/logger.dart';
import 'package:fin_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:fin_app/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/app_state/app_state.dart';
import '../screens/auth_tabs/registration_tab.dart';
import 'auth_cubit_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(
    this._authUseCase,
  ) : super(AuthInitialState());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      logger.info('Sending login request...');
      await _authUseCase.signIn(email: email, password: password);
      emit(AuthSuccessState());
    } catch (e) {
      final error = AppState.catchErrorHandler(e);
      logger.warning('Error during login: ${error.message}');
      emit(AuthErrorState(e.toString()));
      _showToast(error.message.toString());
    }
  }

  Future<void> register({
    required String name,
    required String surname,
    required String patronymic,
    required String birthDate,
    required String email,
    required String password,
    required Gender gender,
  }) async {
    try {
      final date = birthDate.replaceAll(".", "-");
      emit(AuthLoadingState());
      await _authUseCase.signUp(
        birthday: date,
        email: email,
        firstname: name,
        gender: gender == Gender.male ? 'Male' : 'Female',
        lastname: surname,
        password: password,
        patronymic: patronymic,
      );
      await login(email, password);
    } catch (e) {
      final error = AppState.catchErrorHandler(e);
      logger.warning('Error during register: ${error.message}');
      emit(AuthErrorState(error.toString()));
      _showToast(error.message.toString());
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthLoadingState());
      await _authUseCase.logout();
      emit(AuthInitialState());
    } catch (e) {
      final error = AppState.catchErrorHandler(e);
      logger.warning('Error during register: ${error.message}');
      emit(AuthErrorState(e.toString()));
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
