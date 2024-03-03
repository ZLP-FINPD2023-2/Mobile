import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:fin_app/features/goals/data/models/goal_request_dto.dart';
import 'package:fin_app/features/goals/domain/models/goal_model.dart';
import 'package:fin_app/features/goals/domain/usecases/goals_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'goals_state.dart';

@singleton
class GoalsCubit extends Cubit<GoalsState> {
  final GoalsUseCase _useCase;

  GoalsCubit(this._useCase) : super(const GoalsState.initial());

  Future<void> getGoals() async {
    emit(const GoalsState.loading());
    final goals = await _useCase.getGoals();
    emit(GoalsState.success(goals: goals));
  }

  Future<void> addGoal({
    required String name,
    required String description,
    required int goalSum,
    required int currentSum,
    required List<BudgetModel> budgets,
  }) async {
    final goalRequestDTO = GoalRequestDTO(
      name: name,
      description: description,
      goalSum: goalSum,
      currentSum: currentSum,
      budgets: budgets,
    );
    final goals = await _useCase.addGoal(goalRequestDTO);
    emit(GoalsState.success(goals: goals));
  }

  Future<void> deleteGoal({required String goalId}) async {
    emit(const GoalsState.loading());
    final goals = await _useCase.deleteGoal(goalId);
    emit(GoalsState.success(goals: goals));
  }

  Future<void> editGoal({required GoalModel editedGoal}) async {
    emit(const GoalsState.loading());
    final goals = await _useCase.editGoal(editedGoal);
    emit(GoalsState.success(goals: goals));
  }
}
