import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/core/di/di.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/add_budget.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/item_budget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/budget_cubit/budget_cubit.dart';
import 'cubit/budget_cubit/budget_cubit_states.dart';

class BudgetInfo {
  String name;
  String description;
  int sum;

  BudgetInfo({
    required this.name,
    required this.description,
    required this.sum,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'sum': sum,
    };
  }

  factory BudgetInfo.fromJson(Map<String, dynamic> json) {
    return BudgetInfo(
      name: json['name'],
      description: json['description'],
      sum: json['sum'],
    );
  }
}

List<BudgetInfo> listOfBudgets = [];

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BudgetCubit>(
      create: (context) => getIt<BudgetCubit>(),
      child: BudgetScreenContent(),
    );
  }
}

class BudgetScreenContent extends StatefulWidget {
  @override
  _BudgetScreenContentState createState() => _BudgetScreenContentState();
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
                    child: AddBudget(),
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
            return Center(child: CircularProgressIndicator());
          } else if (state is BudgetLoadedState) {
            return ListView.builder(
              itemCount: state.budgets.length,
              itemBuilder: (context, index) {
                final budget = state.budgets[index];
                return ItemBudget(budget: budget, index: index);
              },
            );
          } else {
            return Center(child: Text('Ошибка загрузки'));
          }
        },
      ),
    );
  }
}
