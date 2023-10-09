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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Column(
          children: [
            const SizedBox(height: 14,),
            TabBar(
              tabs: [
              Tab(
                child: Text('Регистрация',style: Theme.of(context).textTheme.labelSmall,),
              ),
              Tab(
                child: Text('Вход',style: Theme.of(context).textTheme.labelSmall),
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
        )));
  }
}
