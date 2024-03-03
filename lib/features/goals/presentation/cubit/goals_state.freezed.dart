// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoalsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<GoalModel> goals) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<GoalModel> goals)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<GoalModel> goals)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoalsInitialState value) initial,
    required TResult Function(_GoalsLoadingState value) loading,
    required TResult Function(_GoalsErrorState value) error,
    required TResult Function(_GoalsSuccessState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoalsInitialState value)? initial,
    TResult? Function(_GoalsLoadingState value)? loading,
    TResult? Function(_GoalsErrorState value)? error,
    TResult? Function(_GoalsSuccessState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoalsInitialState value)? initial,
    TResult Function(_GoalsLoadingState value)? loading,
    TResult Function(_GoalsErrorState value)? error,
    TResult Function(_GoalsSuccessState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalsStateCopyWith<$Res> {
  factory $GoalsStateCopyWith(
          GoalsState value, $Res Function(GoalsState) then) =
      _$GoalsStateCopyWithImpl<$Res, GoalsState>;
}

/// @nodoc
class _$GoalsStateCopyWithImpl<$Res, $Val extends GoalsState>
    implements $GoalsStateCopyWith<$Res> {
  _$GoalsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GoalsInitialStateImplCopyWith<$Res> {
  factory _$$GoalsInitialStateImplCopyWith(_$GoalsInitialStateImpl value,
          $Res Function(_$GoalsInitialStateImpl) then) =
      __$$GoalsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoalsInitialStateImplCopyWithImpl<$Res>
    extends _$GoalsStateCopyWithImpl<$Res, _$GoalsInitialStateImpl>
    implements _$$GoalsInitialStateImplCopyWith<$Res> {
  __$$GoalsInitialStateImplCopyWithImpl(_$GoalsInitialStateImpl _value,
      $Res Function(_$GoalsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoalsInitialStateImpl implements _GoalsInitialState {
  const _$GoalsInitialStateImpl();

  @override
  String toString() {
    return 'GoalsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoalsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<GoalModel> goals) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<GoalModel> goals)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<GoalModel> goals)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoalsInitialState value) initial,
    required TResult Function(_GoalsLoadingState value) loading,
    required TResult Function(_GoalsErrorState value) error,
    required TResult Function(_GoalsSuccessState value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoalsInitialState value)? initial,
    TResult? Function(_GoalsLoadingState value)? loading,
    TResult? Function(_GoalsErrorState value)? error,
    TResult? Function(_GoalsSuccessState value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoalsInitialState value)? initial,
    TResult Function(_GoalsLoadingState value)? loading,
    TResult Function(_GoalsErrorState value)? error,
    TResult Function(_GoalsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _GoalsInitialState implements GoalsState {
  const factory _GoalsInitialState() = _$GoalsInitialStateImpl;
}

/// @nodoc
abstract class _$$GoalsLoadingStateImplCopyWith<$Res> {
  factory _$$GoalsLoadingStateImplCopyWith(_$GoalsLoadingStateImpl value,
          $Res Function(_$GoalsLoadingStateImpl) then) =
      __$$GoalsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoalsLoadingStateImplCopyWithImpl<$Res>
    extends _$GoalsStateCopyWithImpl<$Res, _$GoalsLoadingStateImpl>
    implements _$$GoalsLoadingStateImplCopyWith<$Res> {
  __$$GoalsLoadingStateImplCopyWithImpl(_$GoalsLoadingStateImpl _value,
      $Res Function(_$GoalsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoalsLoadingStateImpl implements _GoalsLoadingState {
  const _$GoalsLoadingStateImpl();

  @override
  String toString() {
    return 'GoalsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoalsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<GoalModel> goals) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<GoalModel> goals)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<GoalModel> goals)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoalsInitialState value) initial,
    required TResult Function(_GoalsLoadingState value) loading,
    required TResult Function(_GoalsErrorState value) error,
    required TResult Function(_GoalsSuccessState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoalsInitialState value)? initial,
    TResult? Function(_GoalsLoadingState value)? loading,
    TResult? Function(_GoalsErrorState value)? error,
    TResult? Function(_GoalsSuccessState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoalsInitialState value)? initial,
    TResult Function(_GoalsLoadingState value)? loading,
    TResult Function(_GoalsErrorState value)? error,
    TResult Function(_GoalsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _GoalsLoadingState implements GoalsState {
  const factory _GoalsLoadingState() = _$GoalsLoadingStateImpl;
}

/// @nodoc
abstract class _$$GoalsErrorStateImplCopyWith<$Res> {
  factory _$$GoalsErrorStateImplCopyWith(_$GoalsErrorStateImpl value,
          $Res Function(_$GoalsErrorStateImpl) then) =
      __$$GoalsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GoalsErrorStateImplCopyWithImpl<$Res>
    extends _$GoalsStateCopyWithImpl<$Res, _$GoalsErrorStateImpl>
    implements _$$GoalsErrorStateImplCopyWith<$Res> {
  __$$GoalsErrorStateImplCopyWithImpl(
      _$GoalsErrorStateImpl _value, $Res Function(_$GoalsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GoalsErrorStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GoalsErrorStateImpl implements _GoalsErrorState {
  const _$GoalsErrorStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GoalsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalsErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalsErrorStateImplCopyWith<_$GoalsErrorStateImpl> get copyWith =>
      __$$GoalsErrorStateImplCopyWithImpl<_$GoalsErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<GoalModel> goals) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<GoalModel> goals)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<GoalModel> goals)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoalsInitialState value) initial,
    required TResult Function(_GoalsLoadingState value) loading,
    required TResult Function(_GoalsErrorState value) error,
    required TResult Function(_GoalsSuccessState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoalsInitialState value)? initial,
    TResult? Function(_GoalsLoadingState value)? loading,
    TResult? Function(_GoalsErrorState value)? error,
    TResult? Function(_GoalsSuccessState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoalsInitialState value)? initial,
    TResult Function(_GoalsLoadingState value)? loading,
    TResult Function(_GoalsErrorState value)? error,
    TResult Function(_GoalsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _GoalsErrorState implements GoalsState {
  const factory _GoalsErrorState({required final String error}) =
      _$GoalsErrorStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$GoalsErrorStateImplCopyWith<_$GoalsErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoalsSuccessStateImplCopyWith<$Res> {
  factory _$$GoalsSuccessStateImplCopyWith(_$GoalsSuccessStateImpl value,
          $Res Function(_$GoalsSuccessStateImpl) then) =
      __$$GoalsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GoalModel> goals});
}

/// @nodoc
class __$$GoalsSuccessStateImplCopyWithImpl<$Res>
    extends _$GoalsStateCopyWithImpl<$Res, _$GoalsSuccessStateImpl>
    implements _$$GoalsSuccessStateImplCopyWith<$Res> {
  __$$GoalsSuccessStateImplCopyWithImpl(_$GoalsSuccessStateImpl _value,
      $Res Function(_$GoalsSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goals = null,
  }) {
    return _then(_$GoalsSuccessStateImpl(
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<GoalModel>,
    ));
  }
}

/// @nodoc

class _$GoalsSuccessStateImpl implements _GoalsSuccessState {
  const _$GoalsSuccessStateImpl({required final List<GoalModel> goals})
      : _goals = goals;

  final List<GoalModel> _goals;
  @override
  List<GoalModel> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  String toString() {
    return 'GoalsState.success(goals: $goals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalsSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._goals, _goals));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_goals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalsSuccessStateImplCopyWith<_$GoalsSuccessStateImpl> get copyWith =>
      __$$GoalsSuccessStateImplCopyWithImpl<_$GoalsSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<GoalModel> goals) success,
  }) {
    return success(goals);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<GoalModel> goals)? success,
  }) {
    return success?.call(goals);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<GoalModel> goals)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(goals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoalsInitialState value) initial,
    required TResult Function(_GoalsLoadingState value) loading,
    required TResult Function(_GoalsErrorState value) error,
    required TResult Function(_GoalsSuccessState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoalsInitialState value)? initial,
    TResult? Function(_GoalsLoadingState value)? loading,
    TResult? Function(_GoalsErrorState value)? error,
    TResult? Function(_GoalsSuccessState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoalsInitialState value)? initial,
    TResult Function(_GoalsLoadingState value)? loading,
    TResult Function(_GoalsErrorState value)? error,
    TResult Function(_GoalsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _GoalsSuccessState implements GoalsState {
  const factory _GoalsSuccessState({required final List<GoalModel> goals}) =
      _$GoalsSuccessStateImpl;

  List<GoalModel> get goals;
  @JsonKey(ignore: true)
  _$$GoalsSuccessStateImplCopyWith<_$GoalsSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
