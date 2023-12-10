import 'package:fin_app/features/goals/domain/models/goal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../home/presentation/domain/models/budget_model.dart';
import 'goals_cubit_state.dart';

@singleton
class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit() : super(const GoalsState.initial());

  Future<void> getGoals() async {
    emit(const GoalsState.loading());
    emit(const GoalsState.success(goals: {}));
  }

  Future<void> addGoal({
    required String name,
    required String description,
    required int goalSum,
    required int currentSum,
    required List<BudgetModel> budgets,
  }) async {
    final goal = GoalModel(
      id: const Uuid().v4(),
      name: name,
      description: description,
      goalSum: goalSum,
      currentSum: currentSum,
      budgets: budgets,
    );
    if (state is GoalsSuccessState) {
      final state = this.state as GoalsSuccessState;
      final goals = {goal.id: goal}..addEntries(state.goals.entries);
      emit(state.copyWith(goals: goals));
    } else {
      emit(GoalsState.success(goals: {goal.id: goal}));
    }
  }

  Future<void> deleteGoal({required String id}) async {
    final state = this.state as GoalsSuccessState;
    final goals = Map.fromEntries(state.goals.entries)..remove(id);
    emit(
      state.copyWith(goals: goals),
    );
  }

  Future<void> editGoal({
    required GoalModel goal,
  }) async {
    final state = this.state as GoalsSuccessState;
    emit(const GoalsLoadingState());
    final goals = Map.fromEntries(
      state.goals.entries.map(
        (e) =>
            e.key == goal.id ? MapEntry<String, GoalModel>(goal.id, goal) : e,
      ),
    );
    emit(state.copyWith(goals: goals));
  }
}
