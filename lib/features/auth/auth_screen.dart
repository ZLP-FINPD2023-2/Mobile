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
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Column(
          children: [
            SizedBox(height: 14,),
            TabBar(tabs: [
              Tab(
                child: Text('Регистрация',style: TextStyle(color: Color(0xff0F172A),fontSize: 14),),
              ),
              Tab(
                child: Text('Вход',style: TextStyle(color: Color(0xff0F172A),fontSize: 14),),
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
        )));
  }
}
