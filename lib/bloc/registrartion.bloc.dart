import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fin_app/core/helpers/token_info/token_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/http_api/http_api.dart';



class RegistrationController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final surnameController = TextEditingController();
  final patronymicController = TextEditingController();
  final birthDateController = TextEditingController();
}

abstract class RegistrationEvent {}

class RegisterUser extends RegistrationEvent {
  final String username;
  final String password;
  final String email;
  final String surname;
  final String patronymic;
  final String birthDate;

  RegisterUser({
    required this.username,
    required this.password,
    required this.email,
    required this.surname,
    required this.patronymic,
    required this.birthDate,
  });
}

abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {}

class RegistrationFailure extends RegistrationState {
  final String error;

  RegistrationFailure({required this.error});
}

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final Dio _dio = HttpAPI.newDio();

  RegistrationBloc() : super(RegistrationInitial());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegisterUser) {
      yield RegistrationLoading();
      try {
        // /register заменить
        final response = await _dio.post('/register', data: {
          'username': event.username,
          'password': event.password,
          'email': event.email,
          'surname': event.surname,
          'patronymic': event.patronymic,
          'birthDate': event.birthDate,
        });

        if (response.statusCode == 200) {
          yield RegistrationSuccess();
        } else {
          yield RegistrationFailure(error: 'Ошибка регистрации');
        }
      } catch (error) {
        yield RegistrationFailure(error: error.toString());
      }
    }
  }
}
