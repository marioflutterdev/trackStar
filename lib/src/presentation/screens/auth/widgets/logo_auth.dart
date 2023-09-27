import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      child: Image(
        image: AssetImage('assets/img/logo.png'),
      ),
    );
  }
}
