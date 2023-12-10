import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/add_budget.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/item_budget.dart';
import 'package:flutter/material.dart';

import '../domain/models/budget_model.dart';

List<BudgetModel> listOfBudgets = [];

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  //final ds = BudgetInfo(name: 'dfdf', description: 'fdfd', sum: 330000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Бюджеты', style: context.textStyles.headlineMedium),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: lightColorScheme.shadow,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddBudget(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(5),
        child: ListView.builder(
          itemCount: listOfBudgets.length,
          itemBuilder: (context, index) {
            return ItemBudget(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
