import 'package:fin_app/features/home/presentation/budget/budget_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BudgetRepository {
  Future<void> saveBudgets(List<BudgetInfo> budgets) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = json.encode(budgets.map((budget) => budget.toJson()).toList());
    await prefs.setString('budgets', encodedData);
  }

  Future<List<BudgetInfo>> loadBudgets() async {
    final prefs = await SharedPreferences.getInstance();
    final String? budgetsString = prefs.getString('budgets');
    if (budgetsString != null) {
      final List<dynamic> jsonData = json.decode(budgetsString);
      return jsonData.map((data) => BudgetInfo.fromJson(data)).toList();
    }
    return [];
  }
}
