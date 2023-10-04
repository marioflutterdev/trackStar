import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trackstar_web/src/presentation/screens/auth/forgot_password/forgot_passaword_screen.dart';
import 'package:trackstar_web/src/presentation/screens/auth/widgets/background_auth.dart';
import 'package:trackstar_web/src/presentation/screens/screens.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const LoadingScreen());
      case '/login':
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.leftToRight,
          settings: settings,
        );
      case '/forgot':
        return PageTransition(
          child: const ForgotPassawordScreen(),
          type: PageTransitionType.leftToRight,
          settings: settings,
        );
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const _PageNotFound());
    }
  }
}

class _PageNotFound extends StatelessWidget {
  const _PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        BackGroundAuth(
          svgRoute: 'assets/svg/404.svg',
        ),
        Center(
          child: Text(
            'Page Not Found',
            style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
