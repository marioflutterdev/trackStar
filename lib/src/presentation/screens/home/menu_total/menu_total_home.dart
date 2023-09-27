import 'package:flutter/material.dart';

class MenuTotalHome extends StatefulWidget {
  const MenuTotalHome({
    super.key,
  });

  @override
  State<MenuTotalHome> createState() => _MenuTotalHomeState();
}

class _MenuTotalHomeState extends State<MenuTotalHome> {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffD9D9D9),
      ),
      child: ElevatedButton(
        onPressed: () {
          key.currentState!.openDrawer(); //<-- SEE HERE
        },
        child: const Text(
          'Elevated Button 1',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
