import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/add_budget.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/budget_info.dart';
import 'package:flutter/material.dart';

class BudgetInfo {
  String name;
  String description;
  int sum;

  BudgetInfo(
      {required this.name, required this.description, required this.sum});
}

List<BudgetInfo> listOfBudgets = [];

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<BudgetScreen> {
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
                builder: (context) => AddBudget(),
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
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BudgetInfoScreen(index: index),
                      ),
                    );
                  },
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 15.0,
                                  width: 15.0,
                                  decoration: const BoxDecoration(
                                    color: walletColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(listOfBudgets[index].name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            Text("${listOfBudgets[index].sum}₽",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700))
                          ])));
            }),
      ),
    );
  }
}
