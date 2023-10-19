import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/network/network_service.dart';
import 'auth_cubit_states.dart';


import 'package:fin_app/core/flutter_core.dart';


class AuthCubit extends Cubit<AuthState> {
  final NetworkService _networkService;
  final FlutterSecureStorage _secureStorage;

  AuthCubit(this._networkService, this._secureStorage) : super(AuthInitialState());

  void login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      print('Sending login request...');
      final response = await _networkService.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      ).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('The connection has timed out!');
      });

      print('Response received: $response');

      if (response is AppStateSuccess) {
        print('Login success: ${response.data}');
        await _secureStorage.write(key: 'user_token', value: response.data?['token']);
        emit(AuthSuccessState());
      } else {
        print('Login failed: ${response.toString()}');
        emit(AuthErrorState('Не удалось выполнить вход'));
      }
    } catch (e) {
      print('Error during login: $e');
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
      print("Starting registration...");
      final response = await _networkService.post(
        '/auth/register',
        data: {
          'name': name,
          'surname': surname,
          'patronymic': patronymic,
          'birthDate': birthDate,
          'email': email,
          'password': password,
        },
      );
      print("Registration response received: $response");
      if (response is AppStateSuccess) {
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState('Не удалось зарегистрироваться'));
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

}