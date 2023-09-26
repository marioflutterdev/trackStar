import 'dart:async';

import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

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
            child: const Logo(),
          ),
        ),
      ),
    );
  }

  checkLoginState(BuildContext context) async {
    //final auth = Provider.of<AuthService>(context);
    //final socket = Provider.of<SockectService>(context);
    //final loginTokenOk = await auth.isLoggedIn();

    /* Timer(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.popAndPushNamed(context, '/login');
      }
    }); */
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.popAndPushNamed(context, '/login');
      },
    );

    /* if (context.mounted) {
      if (loginTokenOk) {
        // socket.connect();
        Navigator.popAndPushNamed(context, 'user');
      } else {
        Navigator.popAndPushNamed(context, 'login');
      }
    } */
  }
}
