import 'package:flutter/material.dart';

class LogoHome extends StatelessWidget {
  const LogoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: const Image(
        image: AssetImage('assets/img/logo.png'),
      ),
    );
  }
}
