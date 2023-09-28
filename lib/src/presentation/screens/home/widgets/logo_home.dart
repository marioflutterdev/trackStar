import 'package:flutter/material.dart';

class LogoHome extends StatelessWidget {
  const LogoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Image(
          image: AssetImage('assets/img/logo.png'),
        ),
      ),
    );
  }
}
