import 'dart:html';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:trackstar_web/src/config/routes/app_routes.dart';
import 'package:trackstar_web/src/data/data.dart';
import 'package:trackstar_web/src/data/datasource/products/edit_products.dart';

import 'package:trackstar_web/src/presentation/provider/providers.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  final currentUri = Uri.parse(window.location.href);
  final fragment = currentUri.fragment;
  final fragmentParams = Uri.splitQueryString(fragment);
  final accessToken = fragmentParams['access_token'];

  setPathUrlStrategy();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => NavegacionDrawerProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                ResetPasswordProvider(accessToken: accessToken.toString())),
        ChangeNotifierProvider(create: (context) => GetUser()),
        ChangeNotifierProvider(create: (context) => GetNotificaciones()),
        ChangeNotifierProvider(create: (context) => GetSolicitudes()),
        ChangeNotifierProvider(create: (context) => AddSolicitudes()),
        ChangeNotifierProvider(create: (context) => AddNotificaciones()),
        ChangeNotifierProvider(create: (context) => UploadUser()),
        ChangeNotifierProvider(create: (context) => NewCartItem()),
        ChangeNotifierProvider(create: (context) => LoginAuthProvider()),
        ChangeNotifierProvider(create: (context) => GetProducts()),
        ChangeNotifierProvider(create: (context) => GetCenterDistribution()),
        ChangeNotifierProvider(create: (context) => NewProduct()),
        ChangeNotifierProvider(create: (context) => EditProduct()),
        ChangeNotifierProvider(create: (context) => DelateProduct()),
        ChangeNotifierProvider(create: (context) => NewCenter()),
        ChangeNotifierProvider(create: (context) => DeleteCenter()),
        ChangeNotifierProvider(create: (context) => EditCenter()),
        ChangeNotifierProvider(create: (context) => NewInventoryItem()),
        ChangeNotifierProvider(create: (context) => GetCartProducts()),
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
