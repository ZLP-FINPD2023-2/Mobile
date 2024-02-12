import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/transactions/domain/models/transaction_model.dart';
import 'package:fin_app/features/transactions/presentation/screens/add_transaction.dart';
import 'package:fin_app/features/transactions/presentation/widgets/item_transaction.dart';
import 'package:flutter/material.dart';

var dateMap = <String, List<TransactionModel>>{};

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text('Транзакции', style: context.textStyles.headlineMedium),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: lightColorScheme.shadow,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTransaction(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(
              start: 24,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'За ноябрь',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: dateMap.length,
            itemBuilder: (context, index) {
              final key = dateMap.keys.elementAt(index);
              final listOfTransaction = dateMap[key];
              return ItemTransaction(
                dateKey: key,
                listOfTransactions: listOfTransaction!,
              );
            },
          ),
        ],
      ),
    );
  }
}
