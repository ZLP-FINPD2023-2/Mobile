import 'package:flutter/material.dart';
import 'auth_tabs/login_tab.dart';
import 'auth_tabs/registration_tab.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  TabBar(tabs: [
                    Tab(
                      child: Text(
                        'Регистрация',
                      ),
                    ),
                    Tab(
                      child: Text('Вход'),
                    )
                  ]),
                  Expanded(
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
