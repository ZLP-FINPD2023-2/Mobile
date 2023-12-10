import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/home/presentation/transaction/widgets/delete_transaction.dart';
import 'package:fin_app/features/home/presentation/transaction/widgets/edit_transaction.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/features/home/presentation/transaction/transaction_screen.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class IncomeInfo extends StatefulWidget {
  final int index;
  final List<TransactionInfo> listOfTransactions;

  const IncomeInfo({
    required this.index,
    required this.listOfTransactions,
    super.key,
  });

  @override
  State<IncomeInfo> createState() => _IncomeInfoState();
}

class _IncomeInfoState extends State<IncomeInfo> with TickerProviderStateMixin {
  late AnimationController _controller;
  late String name = widget.listOfTransactions[widget.index].name;
  late String description = widget.listOfTransactions[widget.index].description;
  late int sum = widget.listOfTransactions[widget.index].sum;
  late String date = widget.listOfTransactions[widget.index].date;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Убедитесь, что контроллер уничтожен при выходе из виджета
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff22c55e),
        leading: IconButton(
          icon: const Icon(Icons.close, color: textWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Транзакция',
          style: context.textStyles.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit_outlined,
              color: textWhite,
              fill: 0,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditTransaction(
                          index: widget.index,
                          listOfTransaction: widget.listOfTransactions)));
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_outlined, color: textWhite),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => DeleteTransaction(
                    index: widget.index,
                    listOfTransaction: widget.listOfTransactions),
              );
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation:
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
        builder: (context, child) {
          return SlidingUpPanel(
            maxHeight: MediaQuery.of(context).size.height * 0.55,
            minHeight: MediaQuery.of(context).size.height * 0.1,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        _buildContainer(100 * _controller.value),
                        _buildContainer(150 * _controller.value),
                        _buildContainer(200 * _controller.value),
                        const Align(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '+$sum',
                    style: const TextStyle(
                        fontSize: 32,
                        color: Color(0xff22c55e),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            panelBuilder: (controller) => PanelWidget(
              date: date,
              controller: controller,
            ),
          );
        },
      ),
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xff22c55e).withOpacity(1 - _controller.value),
      ),
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController controller;

  final String date;

  const PanelWidget({
    Key? key,
    required this.date,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 45,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Подробности',
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 20),
          ),
          TextFormField(
            enabled: false,
            initialValue: date,
            style: const TextStyle(color: Colors.black),
            decoration: homeTheme.copyWith(
              labelText: 'Дата',
            ),
          ),
        ],
      ),
    );
  }
}
