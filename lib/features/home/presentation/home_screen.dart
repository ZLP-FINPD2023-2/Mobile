import 'package:fin_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fin_app/features/goals/presentation/cubit/goals_cubit.dart';
import 'package:fin_app/features/goals/presentation/goals_screen.dart';
import 'package:fin_app/features/home/presentation/settings/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/features/home/presentation/budget/budget_screen.dart';

import '../../../core/di/di.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => getIt<AuthCubit>(),
        ),
        BlocProvider<GoalsCubit>(
          create: (_) => getIt<GoalsCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.transparent,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/home_icon.svg',
                color: homeColor,
              ),
              icon: SvgPicture.asset('assets/home_icon.svg'),
              label: 'Главная',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/target_icon.svg',
                color: targetColor,
              ),
              icon: SvgPicture.asset('assets/target_icon.svg'),
              label: 'Цели',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/barchart_icon.svg',
                color: transitionColor,
              ),
              icon: SvgPicture.asset('assets/barchart_icon.svg'),
              label: 'Транзакции',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/wallet_icon.svg',
                color: walletColor,
              ),
              icon: SvgPicture.asset('assets/wallet_icon.svg'),
              label: 'Бюджет',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/settings_icon.svg',
              ),
              icon: SvgPicture.asset('assets/settings_icon.svg'),
              label: 'Настройки',
            ),
          ],
        ),
        body: <Widget>[
          const Card(),
          const GoalsScreen(),
          const Card(),
          const BudgetScreen(),
          const SettingsTab()
        ][currentPageIndex],
      ),
    );
  }
}
