import 'package:fin_app/features/goals/data/models/goal_request_dto.dart';
import 'package:fin_app/features/goals/domain/mappers/goal_mapper.dart';
import 'package:fin_app/features/goals/domain/models/goal_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GoalsUseCase {
  final List<GoalModel> goals;

  GoalsUseCase() : goals = <GoalModel>[];

  Future<List<GoalModel>> getGoals() async {
    return goals;
  }

  Future<List<GoalModel>> addGoal(GoalRequestDTO goalRequestDTO) async {
    final goal = GoalMapper.fromDTO(goalRequestDTO);
    goals.add(goal);
    return goals;
  }

  Future<List<GoalModel>> editGoal(GoalModel editedGoal) async {
    final index = goals.indexWhere((goal) => goal.id == editedGoal.id);
    goals[index] = editedGoal;

    return goals;
  }

  Future<List<GoalModel>> deleteGoal(String goalId) async {
    goals.removeWhere((goal) => goal.id == goalId);
    return Future.delayed(const Duration(milliseconds: 500), () => goals);
  }
}
