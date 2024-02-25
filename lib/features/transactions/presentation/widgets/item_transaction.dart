import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/transactions/domain/models/transaction_model.dart';
import 'package:fin_app/features/transactions/presentation/screens/expenditure_info.dart';
import 'package:fin_app/features/transactions/presentation/screens/income_info.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/features/transactions/presentation/screens/add_transaction.dart';

class ItemTransaction extends StatelessWidget {
  final String dateKey;
  final List<TransactionModel> listOfTransactions;

  const ItemTransaction({
    required this.dateKey,
    required this.listOfTransactions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              setDate(dateKey),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listOfTransactions.length,
          itemBuilder: (context, index) {
            bool isIncomeSelected =
                (listOfTransactions[index].type == TransactionType.income);

            if (index < listOfTransactions.length - 1) {
              return GestureDetector(
                onTap: () {
                  if (listOfTransactions[index].type ==
                      TransactionType.income) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTransaction(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExpenditureInfo(
                          index: index,
                          listOfTransactions: listOfTransactions,
                        ),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 16, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 15.0,
                                width: 15.0,
                                decoration: BoxDecoration(
                                  color: isIncomeSelected
                                      ? const Color(0xff059669)
                                      : errorColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                listOfTransactions[index].name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${listOfTransactions[index].sum}₽",
                            style: TextStyle(
                              fontSize: 16,
                              color: isIncomeSelected
                                  ? const Color(0xff059669)
                                  : errorColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 1,
                        color: context.colors.onSurface,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  if (listOfTransactions[index].type ==
                      TransactionType.income) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IncomeInfo(
                          index: index,
                          listOfTransactions: listOfTransactions,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExpenditureInfo(
                          index: index,
                          listOfTransactions: listOfTransactions,
                        ),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 15.0,
                            width: 15.0,
                            decoration: BoxDecoration(
                              color: isIncomeSelected
                                  ? const Color(0xff059669)
                                  : errorColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            listOfTransactions[index].name,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        isIncomeSelected
                            ? "+${listOfTransactions[index].sum}₽"
                            : "-${listOfTransactions[index].sum}₽",
                        style: TextStyle(
                          fontSize: 16,
                          color: isIncomeSelected
                              ? const Color(0xff059669)
                              : errorColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

String setDate(String date) {
  Map<int, String> monthMap = {
    1: 'январь',
    2: 'февраль',
    3: 'март',
    4: 'апрель',
    5: 'май',
    6: 'июнь',
    7: 'июль',
    8: 'август',
    9: 'сентябрь',
    10: 'октябрь',
    11: 'ноябрь',
    12: 'декабрь',
  };
  Map<int, String> dayOfWeekMap = {
    1: 'пн',
    2: 'вт',
    3: 'ср',
    4: 'чт',
    5: 'пт',
    6: 'сб',
    7: 'вс',
  };

  DateTime now = DateTime.now();
  String today =
      DateTime(now.year, now.month, now.day).toLocal().toString().split(' ')[0];
  String todayYear = today.substring(0, 4);
  String todayMonth = today.substring(5, 7);
  String todayDay = today.substring(8, 10);
  String todayDate = '$todayDay.$todayMonth.$todayYear';
  String dayOfWeekName = dayOfWeekMap[DateTime.parse(
        '${date.substring(6, 10)}-${date.substring(3, 5)}-${date.substring(0, 2)}',
      ).weekday] ??
      'Некорректный день недели';
  String newDate =
      '${date.substring(0, 2)} ${monthMap[int.parse(date.substring(3, 5))]!}, $dayOfWeekName';
  if (date == todayDate) {
    return 'Сегодня';
  } //else if (){}
  else {
    return newDate;
  }
}
