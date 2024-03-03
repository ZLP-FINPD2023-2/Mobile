// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoalRequestDTO _$GoalRequestDTOFromJson(Map<String, dynamic> json) {
  return _GoalRequestDTO.fromJson(json);
}

/// @nodoc
mixin _$GoalRequestDTO {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get goalSum => throw _privateConstructorUsedError;
  int get currentSum => throw _privateConstructorUsedError;
  List<BudgetModel> get budgets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalRequestDTOCopyWith<GoalRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalRequestDTOCopyWith<$Res> {
  factory $GoalRequestDTOCopyWith(
          GoalRequestDTO value, $Res Function(GoalRequestDTO) then) =
      _$GoalRequestDTOCopyWithImpl<$Res, GoalRequestDTO>;
  @useResult
  $Res call(
      {String name,
      String description,
      int goalSum,
      int currentSum,
      List<BudgetModel> budgets});
}

/// @nodoc
class _$GoalRequestDTOCopyWithImpl<$Res, $Val extends GoalRequestDTO>
    implements $GoalRequestDTOCopyWith<$Res> {
  _$GoalRequestDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? goalSum = null,
    Object? currentSum = null,
    Object? budgets = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      goalSum: null == goalSum
          ? _value.goalSum
          : goalSum // ignore: cast_nullable_to_non_nullable
              as int,
      currentSum: null == currentSum
          ? _value.currentSum
          : currentSum // ignore: cast_nullable_to_non_nullable
              as int,
      budgets: null == budgets
          ? _value.budgets
          : budgets // ignore: cast_nullable_to_non_nullable
              as List<BudgetModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalRequestDTOImplCopyWith<$Res>
    implements $GoalRequestDTOCopyWith<$Res> {
  factory _$$GoalRequestDTOImplCopyWith(_$GoalRequestDTOImpl value,
          $Res Function(_$GoalRequestDTOImpl) then) =
      __$$GoalRequestDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      int goalSum,
      int currentSum,
      List<BudgetModel> budgets});
}

/// @nodoc
class __$$GoalRequestDTOImplCopyWithImpl<$Res>
    extends _$GoalRequestDTOCopyWithImpl<$Res, _$GoalRequestDTOImpl>
    implements _$$GoalRequestDTOImplCopyWith<$Res> {
  __$$GoalRequestDTOImplCopyWithImpl(
      _$GoalRequestDTOImpl _value, $Res Function(_$GoalRequestDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? goalSum = null,
    Object? currentSum = null,
    Object? budgets = null,
  }) {
    return _then(_$GoalRequestDTOImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      goalSum: null == goalSum
          ? _value.goalSum
          : goalSum // ignore: cast_nullable_to_non_nullable
              as int,
      currentSum: null == currentSum
          ? _value.currentSum
          : currentSum // ignore: cast_nullable_to_non_nullable
              as int,
      budgets: null == budgets
          ? _value._budgets
          : budgets // ignore: cast_nullable_to_non_nullable
              as List<BudgetModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalRequestDTOImpl implements _GoalRequestDTO {
  const _$GoalRequestDTOImpl(
      {required this.name,
      required this.description,
      required this.goalSum,
      required this.currentSum,
      final List<BudgetModel> budgets = const []})
      : _budgets = budgets;

  factory _$GoalRequestDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalRequestDTOImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final int goalSum;
  @override
  final int currentSum;
  final List<BudgetModel> _budgets;
  @override
  @JsonKey()
  List<BudgetModel> get budgets {
    if (_budgets is EqualUnmodifiableListView) return _budgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgets);
  }

  @override
  String toString() {
    return 'GoalRequestDTO(name: $name, description: $description, goalSum: $goalSum, currentSum: $currentSum, budgets: $budgets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalRequestDTOImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.goalSum, goalSum) || other.goalSum == goalSum) &&
            (identical(other.currentSum, currentSum) ||
                other.currentSum == currentSum) &&
            const DeepCollectionEquality().equals(other._budgets, _budgets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, goalSum,
      currentSum, const DeepCollectionEquality().hash(_budgets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalRequestDTOImplCopyWith<_$GoalRequestDTOImpl> get copyWith =>
      __$$GoalRequestDTOImplCopyWithImpl<_$GoalRequestDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalRequestDTOImplToJson(
      this,
    );
  }
}

abstract class _GoalRequestDTO implements GoalRequestDTO {
  const factory _GoalRequestDTO(
      {required final String name,
      required final String description,
      required final int goalSum,
      required final int currentSum,
      final List<BudgetModel> budgets}) = _$GoalRequestDTOImpl;

  factory _GoalRequestDTO.fromJson(Map<String, dynamic> json) =
      _$GoalRequestDTOImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  int get goalSum;
  @override
  int get currentSum;
  @override
  List<BudgetModel> get budgets;
  @override
  @JsonKey(ignore: true)
  _$$GoalRequestDTOImplCopyWith<_$GoalRequestDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
