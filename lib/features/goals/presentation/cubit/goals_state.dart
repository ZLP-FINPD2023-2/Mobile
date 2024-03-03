import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/goal_model.dart';

part 'goals_state.freezed.dart';

@freezed
class GoalsState with _$GoalsState {
  const factory GoalsState.initial() = _GoalsInitialState;

  const factory GoalsState.loading() = _GoalsLoadingState;

  const factory GoalsState.error({
    required String error,
  }) = _GoalsErrorState;

  const factory GoalsState.success({
    required List<GoalModel> goals,
  }) = _GoalsSuccessState;
}
