import 'package:flutter/material.dart';

import '../menu_left/menu_left_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        const MenuLeft(),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(0, 30, 30, 30),
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffD9D9D9),
          ),
        ))
      ],
    ));
  }
}
