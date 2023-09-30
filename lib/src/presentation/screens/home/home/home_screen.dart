import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../drawer/menu_drawer_home.dart';
import 'package:trackstar_web/src/presentation/screens/home/widgets/widgets.dart';
import 'package:trackstar_web/src/presentation/provider/menu_drawer/menu_drawer_provider.dart';

import '../menu_total/menu_total_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuDrawerProvider(),
      child: const Scaffold(
        body: Stack(
          children: [
            _ScaffoldHome(),
            MenuLeft(),
          ],
        ),
      ),
    );
  }
}

class _ScaffoldHome extends StatelessWidget {
  const _ScaffoldHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 236, 234, 234),
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Footer(),
          ),
          MenuTotalHome(),
        ],
      ),
    );
  }
}