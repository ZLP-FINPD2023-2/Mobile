import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/goal_model.dart';

part 'goals_cubit_state.freezed.dart';

@freezed
class GoalsState with _$GoalsState {
  const factory GoalsState.initial() = GoalsInitialState;

  const factory GoalsState.loading() = GoalsLoadingState;

  const factory GoalsState.eror({
    required String error,
  }) = GoalsErrorState;

  const factory GoalsState.success({
    required Map<String, GoalModel> goals,
  }) = GoalsSuccessState;
}
