// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'auth_tabs/login_tab.dart';
import 'auth_tabs/registration_tab.dart';

class AuthScreen extends StatelessWidget {
  final int initialIndex;
  const AuthScreen({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: DefaultTabController(
              initialIndex: initialIndex,
              length: 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  TabBar(tabs: [
                    Tab(
                      child: Text(
                        'Регистрация',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Tab(
                      child: Text('Вход', style: Theme.of(context).textTheme.labelSmall),
                    )
                  ]),
                  const Expanded(
                    flex: 2,
                    child: TabBarView(
                      children: [
                        RegistrationTab(),
                        LoginTab(),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
