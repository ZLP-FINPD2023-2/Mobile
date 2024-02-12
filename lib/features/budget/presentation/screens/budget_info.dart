import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:fin_app/features/budget/presentation/cubit/budget_cubit.dart';
import 'package:fin_app/features/budget/presentation/cubit/budget_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/features/budget/presentation/screens/delete_budget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fin_app/features/budget/presentation/screens/edit_budget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BudgetInfoScreen extends StatefulWidget {
  final int index;
  final BudgetCubit budgetCubit;

  const BudgetInfoScreen(
      {Key? key, required this.index, required this.budgetCubit})
      : super(key: key);

  @override
  State<BudgetInfoScreen> createState() => _BudgetInfoScreenState();
}

class _BudgetInfoScreenState extends State<BudgetInfoScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: const Duration(seconds: 3),
    )..repeat();
    widget.budgetCubit.loadBudgets();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetCubit, BudgetState>(
      bloc: widget.budgetCubit,
      builder: (context, state) {
        if (state is BudgetLoadedState) {
          final budgetInfo = state.budgets[widget.index];
          return buildBudgetInfoScreen(budgetInfo);
        } else if (state is BudgetLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Ошибка загрузки'));
        }
      },
    );
  }

  Scaffold buildBudgetInfoScreen(BudgetModel budgetInfo) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: budgetColor,
        leading: IconButton(
          icon: const Icon(Icons.close, color: textWhite),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Бюджет ${budgetInfo.name}',
          style: context.textStyles.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: textWhite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditBudget(
                    index: widget.index,
                    budgetCubit: widget.budgetCubit,
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
                  budgetCubit: widget.budgetCubit,
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
            body: buildPanelBody(budgetInfo),
            panelBuilder: (controller) => PanelWidget(
              name: budgetInfo.name,
              description: budgetInfo.description,
              sum: budgetInfo.sum,
              controller: controller,
            ),
          );
        },
      ),
    );
  }

  Widget buildPanelBody(BudgetModel budgetInfo) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 120),
          buildAnimatedContainer(),
          Text(
            budgetInfo.name,
            style: const TextStyle(
                fontSize: 28, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          Text(
            budgetInfo.sum.toString(),
            style: const TextStyle(
                fontSize: 24,
                color: Color(0xff1b438f),
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget buildAnimatedContainer() {
    return SizedBox(
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
          ),
        ],
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
          const SizedBox(height: 16),
          const Text(
            'Подробности',
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 20),
          ),
          TextFormField(
            enabled: false,
            initialValue: name,
            style: const TextStyle(color: Colors.black),
            decoration: homeTheme.copyWith(labelText: 'Название'),
          ),
          TextFormField(
            enabled: false,
            initialValue: description,
            style: const TextStyle(color: Colors.black),
            decoration: homeTheme.copyWith(labelText: 'Описание'),
          ),
          TextFormField(
            enabled: false,
            initialValue: sum.toString(),
            style: const TextStyle(color: Colors.black),
            decoration: homeTheme.copyWith(labelText: 'Сумма'),
          ),
        ],
      ),
    );
  }
}
