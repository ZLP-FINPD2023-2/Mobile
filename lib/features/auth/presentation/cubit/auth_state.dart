import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/app_state/app_state.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState extends AppState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInitial;

  const factory AuthState.loading() = _AuthStateLoading;

  const factory AuthState.error({String? error}) = _AuthStateError;

  const factory AuthState.success() = _AuthStateSuccess;
}
