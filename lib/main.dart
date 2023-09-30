import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/config/routes/app_routes.dart';
import 'package:trackstar_web/src/config/theme/app_theme.dart';
import 'package:trackstar_web/src/presentation/provider/providers.dart';
import 'package:trackstar_web/src/presentation/screens/screens.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      initialRoute: AppRoute.initialRoute,
      routes: AppRoute.routes,
      theme: context.watch<ThemeProvider>().themeData,
    );
  }
}
