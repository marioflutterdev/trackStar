import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:trackstar_web/src/presentation/provider/auth/auth_provicional.dart';

import 'package:trackstar_web/src/presentation/screens/screens.dart';

class AppRoute {
  static const initialRouter = '/';
  static const notFoundRouter = '/nofound';
  static const loginRouter = '/login';
  static const fotgotRouter = '/forgot';
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
        path: fotgotRouter,
        builder: (context, state) => const ForgotPassawordScreen(),
      ),
      GoRoute(
          path: homeRouter,
          builder: (_, state) => const HomeScreen(),
          redirect: (context, state) =>
              (AuthService.authenticated) ? null : '/nofound')
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const PageNotFoundScreen(),
  );

  static String? _redirect(BuildContext context) {
    return AuthService.authenticated ? null : context.namedLocation("/nofound");
  }
}
