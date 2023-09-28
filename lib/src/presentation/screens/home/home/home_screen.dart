import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/presentation/provider/menu_drawer/menu_drawer_provider.dart';

import 'package:trackstar_web/src/presentation/screens/screens.dart';

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
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromARGB(255, 236, 234, 234),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 600,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xff56AEFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    )
                  ],
                )),
            const MenuLeft(),
          ],
        ),
      ),
    );
  }
}
