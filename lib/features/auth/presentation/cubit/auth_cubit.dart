import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/features/auth/domain/models/usecases/auth_usecase.dart';
import 'package:fin_app/features/auth/presentation/auth_tabs/registration_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'auth_cubit_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(this._authUseCase) : super(AuthInitialState());

  void login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      await _authUseCase.signIn(email: email, password: password);
      emit(AuthSuccessState());
    } catch (e) {
      _showToast(e.toString());
    }
  }

  void register(
      {required String name,
      required String surname,
      required String patronymic,
      required String birthDate,
      required String email,
      required String password,
      required Gender gender}) async {
    try {
      emit(AuthLoadingState());
      await _authUseCase.signUp(
        age: birthDate,
        email: email,
        firstname: name,
        gender: gender == Gender.male ? 'Male' : 'Female',
        lastname: surname,
        password: password,
        patronymic: patronymic,
      );
      emit(AuthSuccessState());
    } catch (e) {
      _showToast(e.toString());
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: lightColorScheme.error,
        textColor: lightColorScheme.background,
        fontSize: 16.0);
  }
}
