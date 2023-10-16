import 'package:fin_app/core/di/di.dart';
import 'package:fin_app/core/env/env.dart';
import 'package:fin_app/core/services/network/http_api/http_api.dart';
import 'package:fin_app/core/services/network/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';

void main() {
  HttpAPI.initialize(
    defaultBaseURL: Env.serverUrl,
    getAuthTokenFn: () => getIt<SecureStorage>().instance.read(key: 'token'),
    logoutFn: () => getIt<SecureStorage>().instance.delete(key: 'token'),
  );
  confingureDependecies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('FinApp'),
        ),
      ),
    );
  }
}
