import 'package:flutter/material.dart';

import '../menu_drawer/menu_drawer_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(30),
              height: double.infinity,
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
            ),
          )
        ],
      ),
      drawer: Drawer(
        width: size.width * .30,
        child: const MenuLeft(),
      ),
    );
  }
}
