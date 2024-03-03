import 'package:collection/collection.dart';
import 'package:fin_app/features/goals/domain/models/goal_model.dart';
import 'package:fin_app/features/goals/presentation/cubit/goals_cubit.dart';
import 'package:fin_app/features/goals/presentation/cubit/goals_state.dart';
import 'package:fin_app/features/goals/presentation/screens/delete_goal.dart';
import 'package:fin_app/features/goals/presentation/screens/edit_goal.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoalInfoScreen extends StatelessWidget {
  final String goalId;

  const GoalInfoScreen({
    super.key,
    required this.goalId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalsCubit, GoalsState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (goals) {
            final goal =
                goals.firstWhereOrNull((element) => element.id == goalId);
            if (goal == null) {
              throw StateError("Goal doesn't exist");
            }
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
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditGoal(
                          goal: goal,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: textWhite,
                    ),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => DeleteGoal(
                        id: goal.id,
                      ),
                    ),
                  ),
                ],
              ),
              body: SlidingUpPanel(
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
                      const AnimatedIcon(),
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
                  goal: goal,
                  controller: controller,
                ),
              ),
            );
          },
          error: (error) => Center(
            child: Text('Что-то пошло не так! $error'),
          ),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final GoalModel goal;

  const _PanelWidget({
    required this.goal,
    required this.controller,
  });

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
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          fieldBuild(labelText: 'Название', value: goal.name),
          const SizedBox(height: 24),
          fieldBuild(labelText: 'Накоплено', value: '${goal.currentSum} ₽'),
          const SizedBox(height: 24),
          fieldBuild(labelText: 'Описание', value: goal.description),
          const SizedBox(height: 24),
          fieldBuild(labelText: 'Сумма', value: '${goal.goalSum} ₽'),
          if (goal.budgets.isNotEmpty) ...[
            const SizedBox(height: 24),
            fieldBuild(
              labelText: 'Бюджеты',
              value:
                  'Бюджет ${goal.budgets.map((budget) => budget.id).join(', ')}',
            ),
          ]
        ],
      ),
    );
  }

  Widget fieldBuild({required String labelText, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: homeTheme.labelStyle,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: homeTheme.labelStyle?.copyWith(color: textDark),
        ),
        const SizedBox(height: 4),
        Container(
          color: const Color(0xffA1A1AA),
          height: 1,
        ),
      ],
    );
  }
}

class AnimatedIcon extends StatefulWidget {
  const AnimatedIcon({super.key});

  @override
  State<AnimatedIcon> createState() => _AnimatedIconState();
}

class _AnimatedIconState extends State<AnimatedIcon>
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
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
      builder: (context, child) {
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
    _controller.dispose();
    super.dispose();
  }
}
