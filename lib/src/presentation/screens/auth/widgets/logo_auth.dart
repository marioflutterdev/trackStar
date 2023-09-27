import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

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
