import 'package:fin_app/core/di/di.dart';
import 'package:fin_app/core/env/env.dart';
import 'package:fin_app/core/services/network/http_api/http_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpAPI.initialize(
    defaultBaseURL: Env.serverUrl,
    getAuthTokenFn: () => getIt<FlutterSecureStorage>().read(key: 'token'),
    logoutFn: () => getIt<FlutterSecureStorage>().delete(key: 'token'),
  );

  confingureDependecies();

  String initialRoute = await getInitialRoute();

  runApp(MainApp(initialRoute: initialRoute));
}


Future<String> getInitialRoute() async {
  final storage = getIt<FlutterSecureStorage>();
  String? token = await storage.read(key: 'user_token');
  print("Token: $token");
  return token != null && token.isNotEmpty ? '/placeholder' : '/';
}


class MainApp extends StatelessWidget {
  final String initialRoute;

  const MainApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: routes,
      theme: appTheme,
    );
  }
}
