import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:trackstar_web/src/data/datasource/auth/login.dart';

import 'package:trackstar_web/src/presentation/screens/screens.dart';

class AppRoute {
  static const initialRouter = '/';
  static const notFoundRouter = '/nofound';
  static const loginRouter = '/login';
  static const forgotRouter = '/forgot';
  static const updateRouter = '/forgot/update';
  static const homeRouter = '/home';

  static final GoRouter routes = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: initialRouter,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: notFoundRouter,
        builder: (context, state) => const PageNotFoundScreen(),
      ),
      GoRoute(
        path: loginRouter,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: forgotRouter,
        builder: (context, state) => const ForgotPassawordScreen(),
      ),
      GoRoute(
        path: updateRouter,
        builder: (context, state) => const UpdatePasswordScreen(),
      ),
      GoRoute(
          path: homeRouter,
          builder: (_, state) => const HomeScreen(),
          redirect: (context, state) =>
              (LoginAuthProvider.authenticated) ? null : '/home')
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const PageNotFoundScreen(),
  );

  static String? _redirect(BuildContext context) {
    return LoginAuthProvider.authenticated
        ? null
        : context.namedLocation("/nofound");
  }
}
