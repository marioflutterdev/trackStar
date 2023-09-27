import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/screens/screens.dart';

class AppRoute {
  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (p0) => const LoadingScreen(),
    '/login': (p0) => const LoginScreen(),
    '/home': (p0) => const HomeScreen(),
  };
}
