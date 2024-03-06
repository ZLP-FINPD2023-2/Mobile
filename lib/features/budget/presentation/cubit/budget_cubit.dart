import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:fin_app/features/budget/domain/usecases/budget_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'budget_cubit_states.dart';

@singleton
class BudgetCubit extends Cubit<BudgetState> {
  final BudgetUseCase _budgetUseCase;

  BudgetCubit(this._budgetUseCase) : super(BudgetInitialState());

  Future<void> loadBudgets() async {
    try {
      emit(BudgetLoadingState());
      final budgets = await _budgetUseCase.getBudgets();
      emit(BudgetLoadedState(budgets));
    } catch (e) {
      emit(BudgetErrorState(e.toString()));
    }
  }

  Future<void> addBudget(BudgetModel budget) async {
    try {
      emit(BudgetLoadingState());
      final budgets = await _budgetUseCase.addBudget(budget);
      emit(BudgetLoadedState(budgets));
    } catch (e) {
      emit(BudgetErrorState(e.toString()));
    }
  }

  Future<void> updateBudget(int index, BudgetModel updatedBudget) async {
    try {
      emit(BudgetLoadingState());
      final budgets = await _budgetUseCase.updateBudget(index, updatedBudget);
      emit(BudgetLoadedState(budgets));
    } catch (e) {
      emit(BudgetErrorState(e.toString()));
    }
  }

  Future<void> deleteBudget(int index) async {
    try {
      emit(BudgetLoadingState());
      final budgets = await _budgetUseCase.deleteBudget(index);
      emit(BudgetLoadedState(budgets));
    } catch (e) {
      emit(BudgetErrorState(e.toString()));
    }
  }
}