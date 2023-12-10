import 'package:flutter/material.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/features/home/presentation/budget/budget_screen.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/delete_budget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/edit_budget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BudgetInfoScreen extends StatefulWidget {
  final int index;

  const BudgetInfoScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<BudgetInfoScreen> createState() => _BudgetInfoScreenState();
}

class _BudgetInfoScreenState extends State<BudgetInfoScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late String name = listOfBudgets[widget.index].name;
  late String description = listOfBudgets[widget.index].description;
  late int sum = listOfBudgets[widget.index].sum;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: budgetColor,
        leading: IconButton(
          icon: const Icon(Icons.close, color: textWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Бюджет ${listOfBudgets[widget.index].name}',
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
                  builder: (context) => EditBudget(
                    index: widget.index,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_outlined, color: textWhite),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => DeleteBudget(
                  index: widget.index,
                ),
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
                        Align(
                          child: SvgPicture.asset(
                            'assets/wallet_icon.svg',
                            color: Colors.white,
                            width: 35,
                            height: 35,
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    sum.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xff1b438f),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            panelBuilder: (controller) => PanelWidget(
              name: name,
              description: description,
              sum: sum,
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
        color: Colors.blue.withOpacity(1 - _controller.value),
      ),
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController controller;

  final String name;
  final String description;
  final int sum;

  const PanelWidget({
    Key? key,
    required this.name,
    required this.description,
    required this.sum,
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
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Подробности',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          TextFormField(
            enabled: false,
            initialValue: name,
            decoration: homeTheme.copyWith(
              labelText: 'Название',
            ),
          ),
          TextFormField(
            enabled: false,
            initialValue: description,
            decoration: homeTheme.copyWith(
              labelText: 'Описание',
            ),
          ),
          TextFormField(
            enabled: false,
            initialValue: sum.toString(),
            decoration: homeTheme.copyWith(
              labelText: 'Сумма',
            ),
          ),
        ],
      ),
    );
  }
}
