import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/core/di/di.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/budget/data/repositories/budget_repository.dart';
import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:fin_app/features/budget/presentation/screens/add_budget.dart';
import 'package:fin_app/features/budget/presentation/widgets/item_budget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/budget_cubit.dart';
import 'cubit/budget_cubit_states.dart';

List<BudgetModel> listOfBudgets = [];

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BudgetCubit>(
      create: (context) => BudgetCubit(getIt<BudgetRepository>()),
      child: const BudgetScreenContent(),
    );
  }
}

class BudgetScreenContent extends StatefulWidget {
  const BudgetScreenContent({super.key});

  @override
  State<BudgetScreenContent> createState() => _BudgetScreenContentState();
}

class _BudgetScreenContentState extends State<BudgetScreenContent> {
  @override
  void initState() {
    super.initState();
    context.read<BudgetCubit>().loadBudgets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Бюджеты', style: context.textStyles.headlineMedium),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: lightColorScheme.shadow),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return BlocProvider.value(
                    value: BlocProvider.of<BudgetCubit>(context),
                    child: const AddBudget(),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<BudgetCubit, BudgetState>(
        builder: (context, state) {
          if (state is BudgetLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BudgetLoadedState) {
            return ListView.builder(
              itemCount: state.budgets.length,
              itemBuilder: (context, index) {
                final budget = state.budgets[index];
                return ItemBudget(budget: budget, index: index);
              },
            );
          } else {
            return const Center(child: Text('Ошибка загрузки'));
          }
        },
      ),
    );
  }
}
