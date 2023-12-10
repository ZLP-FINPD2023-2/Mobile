import 'package:fin_app/features/goals/presentation/cubit/goals_cubit.dart';
import 'package:fin_app/features/goals/presentation/widgets/delete_goal.dart';
import 'package:fin_app/features/goals/presentation/widgets/edit_goal.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../core/di/di.dart';
import '../cubit/goals_cubit_state.dart';

class GoalInfoScreen extends StatefulWidget {
  final String id;

  const GoalInfoScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<GoalInfoScreen> createState() => _GoalInfoScreenState();
}

class _GoalInfoScreenState extends State<GoalInfoScreen>
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalsCubit, GoalsState>(
      bloc: getIt<GoalsCubit>(),
      builder: (context, state) {
        if (state is! GoalsSuccessState) return const SizedBox();
        final goal = state.goals[widget.id];
        if (goal == null) return const SizedBox();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: targetColor,
            leading: IconButton(
              icon: const Icon(Icons.close, color: textWhite),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Цель: ${goal.name}',
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
                      builder: (context) => EditGoal(
                        id: widget.id,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: textWhite,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DeleteGoal(
                      id: widget.id,
                    ),
                  );
                },
              ),
            ],
          ),
          body: AnimatedBuilder(
            animation: CurvedAnimation(
              parent: _controller,
              curve: Curves.fastOutSlowIn,
            ),
            builder: (context, child) {
              return SlidingUpPanel(
                maxHeight: MediaQuery.of(context).size.height * 0.55,
                minHeight: MediaQuery.of(context).size.height * 0.1,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
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
                        goal.name,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        goal.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: context.colors.primary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Уже накоплено',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff4B5563),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        goal.currentSum.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          color: targetColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'из ${goal.goalSum}₽',
                        style: TextStyle(
                          fontSize: 20,
                          color: context.colors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                panelBuilder: (controller) => _PanelWidget(
                  id: widget.id,
                  controller: controller,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: targetColor.withOpacity(1 - _controller.value),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final String id;

  const _PanelWidget({
    Key? key,
    required this.id,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalsCubit, GoalsState>(
      bloc: getIt<GoalsCubit>(),
      builder: (context, state) {
        if (state is! GoalsSuccessState) return const SizedBox();
        final goal = state.goals[id];
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
                style: TextStyle(
                  color: context.colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                enabled: false,
                initialValue: goal?.name,
                decoration: homeTheme.copyWith(
                  labelText: 'Название',
                ),
              ),
              TextFormField(
                style: TextStyle(
                  color: context.colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                enabled: false,
                initialValue: '${goal?.currentSum} ₽',
                decoration: homeTheme.copyWith(
                  labelText: 'Накоплено',
                ),
              ),
              TextFormField(
                style: TextStyle(
                  color: context.colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                enabled: false,
                initialValue: goal?.description,
                decoration: homeTheme.copyWith(
                  labelText: 'Описание',
                ),
              ),
              TextFormField(
                style: TextStyle(
                  color: context.colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                enabled: false,
                initialValue: '${goal?.goalSum} ₽',
                decoration: homeTheme.copyWith(
                  labelText: 'Сумма',
                ),
              ),
              TextFormField(
                style: TextStyle(
                  color: context.colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                enabled: false,
                initialValue:
                    goal?.budgets != null && goal?.budgets.isEmpty != null
                        ? ''
                        : 'Бюджет ',
                decoration: homeTheme.copyWith(
                  labelText: 'Бюджеты',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
