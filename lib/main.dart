import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:trackstar_web/src/config/routes/app_routes.dart';

import 'package:trackstar_web/src/presentation/provider/providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => NavegacionDrawerProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().themeData,
      routerConfig: AppRoute.routes,
    );
  }
}
