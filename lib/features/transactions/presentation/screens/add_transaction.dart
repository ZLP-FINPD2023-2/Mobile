import 'package:fin_app/features/transactions/domain/models/transaction_model.dart';
import 'package:fin_app/features/transactions/presentation/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TransactionType typeSelected = TransactionType.income;
  bool isIncomeSelected = true;
  final Map<TransactionType, String> menuValues = {
    TransactionType.income: 'Доход',
    TransactionType.expenditure: 'Расход',
  };

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController dateController;
  late final TextEditingController sumController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    dateController = TextEditingController();
    sumController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: textWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: isIncomeSelected
            ? const Color(0xff22c55e)
            : const Color(0xffEF4444),
        title: Text(
          'Новая транзакция',
          style: context.textStyles.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 5, 12, 20),
          child: Column(
            children: [
              DropdownButtonFormField(
                value: typeSelected,
                decoration: homeTheme,
                items: TransactionType.values
                    .toList()
                    .map<DropdownMenuItem<TransactionType>>(
                        (TransactionType value) {
                  return DropdownMenuItem<TransactionType>(
                    value: value,
                    child: Text(
                      menuValues[value] ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    typeSelected = newValue!;
                    if (typeSelected == TransactionType.income) {
                      isIncomeSelected = true;
                    } else {
                      isIncomeSelected = false;
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: isIncomeSelected ? const Color(0xff16a34a) : errorColor,
            ),
            onPressed: () {
              addTransactionToMap(
                TransactionModel(
                  type: typeSelected,
                  name: nameController.text,
                  description: descriptionController.text,
                  sum: int.tryParse(sumController.text) ?? 0,
                  date: dateController.text,
                ),
              );
              dateMap = sortedKeys(dateMap);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransactionScreen(),
                ),
              );
            },
            child: const Text('Сохранить'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    dateController = TextEditingController();
    sumController = TextEditingController();
  }
}

void addTransactionToMap(TransactionModel transaction) {
  String key = transaction.date;

  // Если в карте уже есть запись с текущей датой, добавляем транзакцию в этот список
  if (dateMap.containsKey(key)) {
    dateMap[key]!.add(transaction);
  } else {
    // Иначе создаем новую запись в карте с текущей датой и списком из одной транзакции
    dateMap[key] = [transaction];
  }
}

Map<String, List<TransactionModel>> sortedKeys(
  Map<String, List<TransactionModel>> myMap,
) {
  Map<String, List<TransactionModel>> sortedMap = {};
  List<String> sortedKeys = myMap.keys.toList();

  // TODO: fix RangeError (start): Invalid value: Only valid value is 0: 6
  for (int i = 0; i < sortedKeys.length; i++) {
    String year = sortedKeys[i].substring(6, 10);
    String month = sortedKeys[i].substring(3, 5);
    String day = sortedKeys[i].substring(0, 2);
    sortedKeys[i] = '$year-$month-$day';
  }
  List<DateTime> dates = sortedKeys.map((key) => DateTime.parse(key)).toList();
  dates.sort();
  List<String> sortedDateStrings =
      dates.map((date) => date.toLocal().toString().split(' ')[0]).toList();
  sortedDateStrings.reversed;
  for (int i = 0; i < sortedKeys.length; i++) {
    String year = sortedKeys[i].substring(0, 4);
    String month = sortedKeys[i].substring(5, 7);
    String day = sortedKeys[i].substring(8, 10);
    sortedKeys[i] = '$day.$month.$year';
  }
  for (var key in sortedKeys) {
    sortedMap[key] = myMap[key]!;
  }
  return sortedMap; // Выведет: {a: 1, b: 2, c: 3}
}
