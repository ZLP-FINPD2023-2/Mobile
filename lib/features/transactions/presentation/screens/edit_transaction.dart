import 'package:fin_app/features/transactions/domain/models/transaction_model.dart';
import 'package:fin_app/features/transactions/presentation/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';

class EditTransaction extends StatelessWidget {
  final int index;
  final List<TransactionModel> listOfTransaction;

  EditTransaction({
    Key? key,
    required this.index,
    required this.listOfTransaction,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController sumController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isIncomeSelected =
        (listOfTransaction[index].type == TransactionType.income);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isIncomeSelected
            ? const Color(0xff22c55e)
            : const Color(0xffef4444),
        leading: IconButton(
          icon: const Icon(Icons.close, color: textWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Редактирование',
          style: context.textStyles.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: homeTheme.copyWith(
                    labelText: 'Название',
                    hintText: 'Введите название',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: descriptionController,
                  decoration: homeTheme.copyWith(
                    labelText: 'Описание',
                    hintText: 'Добавьте описание',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: sumController,
                  keyboardType: TextInputType.number,
                  decoration: homeTheme.copyWith(
                    labelText: 'Сумма',
                    hintText: 'Настройте сумму',
                  ),
                ),
                TextFormField(
                  controller: dateController,
                  keyboardType: TextInputType.number,
                  decoration: homeTheme.copyWith(
                    labelText: 'Дата',
                    hintText: '09.10.2004',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: 336,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: isIncomeSelected
                      ? transactionColor
                      : const Color(0xffdc2626),
                ),
                onPressed: () {
                  dateMap.remove(key);

                  final newTransactionModel = listOfTransaction[index].copyWith(
                    name: nameController.text,
                    description: descriptionController.text,
                    sum: int.tryParse(sumController.text) ?? 0,
                    date: dateController.text,
                  );
                  listOfTransaction[index] = newTransactionModel;
                  dateMap[listOfTransaction[index].date] = listOfTransaction;

                  Navigator.pop(context);
                },
                child: const Text('Сохранить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
