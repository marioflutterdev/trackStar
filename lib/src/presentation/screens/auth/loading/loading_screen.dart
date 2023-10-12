import 'dart:async';

import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';

import 'package:trackstar_web/src/presentation/screens/auth/widgets/widgets.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) => Center(
          child: ElasticInDown(
            duration: const Duration(seconds: 3),
            child: const LogoAuth(),
          ),
        ),
      ),
    );
  }

  checkLoginState(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.go('/login');
      },
    );
  }
}
