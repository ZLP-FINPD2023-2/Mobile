import 'package:fin_app/core/app_state/app_state.dart';
import 'package:fin_app/features/home/presentation/budget/budget_screen.dart';


class BudgetState extends AppState {}

class BudgetInitialState extends BudgetState {}

class BudgetLoadingState extends BudgetState {}

class BudgetErrorState extends BudgetState {
  final String error;

  BudgetErrorState(this.error);
}

class BudgetLoadedState extends BudgetState {
  final List<BudgetInfo> budgets;

  BudgetLoadedState(this.budgets);
}