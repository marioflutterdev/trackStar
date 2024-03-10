import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../config/config.dart';
import '../../../../provider/providers.dart';
import '../drawer/menu_drawer_home.dart';
import '../menu_total/menu_total_home.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final movile = AppResponsive.isLargeMobile(context);
    return ChangeNotifierProvider(
      create: (context) => MenuDrawerProvider(),
      child: Scaffold(
          body: Stack(
            children: [
              const _ScaffoldHome(),
              if (!movile) const MenuLeft(),
            ],
          ),
          drawer: const MenuLeft()),
    );
  }
}

class _ScaffoldHome extends StatelessWidget {
  const _ScaffoldHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movile = AppResponsive.isLargeMobile(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).colorScheme.background,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!movile)
            const Positioned(
              bottom: 0,
              child: Footer(),
            ),
          const MenuTotalHome(),
        ],
      ),
    );
  }
}
