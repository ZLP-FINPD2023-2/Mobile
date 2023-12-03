import 'package:fin_app/features/auth/data/sharedPref/budget_repository.dart';
import 'package:fin_app/features/home/presentation/budget/budget_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'budget_cubit_states.dart';


@injectable
class BudgetCubit extends Cubit<BudgetState> {
  final BudgetRepository _budgetRepository;

  BudgetCubit(this._budgetRepository) : super(BudgetInitialState());

  Future<void> loadBudgets() async {
    try {
      emit(BudgetLoadingState());
      final budgets = await _budgetRepository.loadBudgets();
      emit(BudgetLoadedState(budgets));
    } catch (e) {
      emit(BudgetErrorState(e.toString()));
    }
  }

  Future<void> addBudget(BudgetInfo budget) async {
    try {
      emit(BudgetLoadingState());
      final budgets = await _budgetRepository.loadBudgets();
      budgets.add(budget);
      await _budgetRepository.saveBudgets(budgets);
      emit(BudgetLoadedState(budgets));
      // Отправка данных на сервер (если необходимо)
    } catch (e) {
      emit(BudgetErrorState(e.toString()));
    }
  }

  Future<void> updateBudget(int index, BudgetInfo updatedBudget) async {
    try {
      emit(BudgetLoadingState());
      final budgets = await _budgetRepository.loadBudgets();
      budgets[index] = updatedBudget;
      await _budgetRepository.saveBudgets(budgets);
      emit(BudgetLoadedState(budgets));
      // Обновление данных на сервере (если необходимо)
    } catch (e) {
      emit(BudgetErrorState(e.toString()));
    }
  }

  Future<void> deleteBudget(int index) async {
    try {
      emit(BudgetLoadingState());
      final budgets = await _budgetRepository.loadBudgets();
      budgets.removeAt(index);
      await _budgetRepository.saveBudgets(budgets);
      emit(BudgetLoadedState(budgets));
      // Удаление данных с сервера (если необходимо)
    } catch (e) {
      emit(BudgetErrorState(e.toString()));
    }
  }
}
