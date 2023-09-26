import 'package:flutter/material.dart';
import 'package:trackstar_web/src/config/routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.initialRoute,
      routes: AppRoute.routes,
    );
  }
}
