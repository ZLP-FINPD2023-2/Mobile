import 'package:flutter/material.dart';
import 'package:fin_app/features/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeClass().themeData,
      home: const Scaffold(
        body: Center(
          child: Text('FinApp'),
        ),
      ),
    );
  }
}
