
import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:injectable/injectable.dart';

import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class BudgetUseCase {
  final List<BudgetModel> budgets;

  BudgetUseCase() : budgets = <BudgetModel>[];


  Future<List<BudgetModel>> getBudgets() async {
    return budgets;
  }


  Future<List<BudgetModel>> addBudget(BudgetModel newBudget) async {
    budgets.add(newBudget);
    return budgets;
  }


  Future<List<BudgetModel>> updateBudget(int index, BudgetModel updatedBudget) async {
    final index = budgets.indexWhere((budget) => budget.id == updatedBudget.id);
    if (index != -1) {
      budgets[index] = updatedBudget;
    }
    return budgets;
  }


  Future<List<BudgetModel>> deleteBudget(int index) async {
    budgets.removeWhere((budget) => budget.id == index);
    return Future.delayed(const Duration(milliseconds: 500), () => budgets);
  }
}
