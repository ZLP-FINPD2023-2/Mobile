import 'package:fin_app/core/di/di.dart';
import 'package:fin_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  _logout() async {
    final storage = getIt<FlutterSecureStorage>();
    if (await storage.read(key: 'token') != null) {
      await storage.delete(key: 'token');
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamedAndRemoveUntil(Routes.startScreen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: _logout,
        child: const Text('Выйти'),
      ),
    );
  }
}
