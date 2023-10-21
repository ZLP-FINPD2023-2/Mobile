import 'package:fin_app/features/auth/domain/models/usecases/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'auth_cubit_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(this._authUseCase) : super(AuthInitialState());

  void login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      // print('Sending login request...');
      await _authUseCase.signIn(email: email, password: password);
      emit(AuthSuccessState());
    } catch (e) {
      // print('Error during login: $e');
      emit(AuthErrorState(e.toString()));
    }
  }

  void register({
    required String name,
    required String surname,
    required String patronymic,
    required String birthDate,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoadingState());
      await _authUseCase.signUp(
        age: DateTime.now().difference(DateTime.parse(birthDate)).inDays ~/ 365,
        email: email,
        firstname: name,
        gender: true,
        lastname: surname,
        password: password,
        patronymic: patronymic,
      );
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
