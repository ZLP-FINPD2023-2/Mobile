import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

@injectable
class BudgetRepository {
  const BudgetRepository();

  static const String _budgetsKey = 'budgets';

  Future<void> saveBudgets(List<BudgetModel> budgets) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData =
        json.encode(budgets.map((budget) => budget.toJson()).toList());
    await prefs.setString(_budgetsKey, encodedData);
  }

  Future<List<BudgetModel>> loadBudgets() async {
    final prefs = await SharedPreferences.getInstance();
    final String? budgetsString = prefs.getString(_budgetsKey);
    if (budgetsString == null) return [];

    final List<Map<String, dynamic>> jsonData = json.decode(budgetsString);
    return jsonData.map(BudgetModel.fromJson).toList();
  }
}
