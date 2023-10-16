import 'package:fin_app/core/di/di.dart';
import 'package:fin_app/core/env/env.dart';
import 'package:fin_app/core/services/network/http_api/http_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  HttpAPI.initialize(
    defaultBaseURL: Env.serverUrl,
    getAuthTokenFn: () => getIt<FlutterSecureStorage>().read(key: 'token'),
    logoutFn: () => getIt<FlutterSecureStorage>().delete(key: 'token'),
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
