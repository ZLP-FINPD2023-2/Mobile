import 'package:flutter/material.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/budget_info.dart';
import 'package:fin_app/features/home/presentation/budget/budget_screen.dart';
import 'package:fin_app/constants/colors.dart';

class ItemBudget extends StatelessWidget {
  final int index;

  const ItemBudget({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Text(
                  listOfBudgets[index].name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Text(
              "${listOfBudgets[index].sum}₽",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
