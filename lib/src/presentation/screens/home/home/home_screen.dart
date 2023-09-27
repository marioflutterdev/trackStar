import 'package:flutter/material.dart';

import 'package:trackstar_web/src/presentation/screens/screens.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

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
      body: Column(
        children: [
          OnHoverCustomWidget(
            builder: (isHovered) {
              return GestureDetector(
                onTap: () {
                  key.currentState!.openDrawer();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.filter_list),
                ),
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        width: size.width * .20,
        child: const MenuLeft(),
      ),
    );
  }
}
