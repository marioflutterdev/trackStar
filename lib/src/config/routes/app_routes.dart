import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:trackstar_web/src/presentation/screens/screens.dart';

class AppRoute {
  static final GoRouter routes = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/404',
        builder: (context, state) => const PageNotFoundScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/forgot',
        builder: (context, state) => const ForgotPassawordScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        //redirect: (context, state) => _redirect(context),
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const PageNotFoundScreen(),
    errorPageBuilder: (BuildContext context, GoRouterState state) =>
        const MaterialPage(child: PageNotFoundScreen()),
  );

  /* static String? _redirect(BuildContext context) {
    return AuthService.authenticated ? null : context.namedLocation('/404');
  } */
}
