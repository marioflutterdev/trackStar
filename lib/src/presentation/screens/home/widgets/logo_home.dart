import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';
import 'package:trackstar_web/src/presentation/provider/menu_drawer/menu_drawer_provider.dart';

class LogoHome extends StatelessWidget {
  const LogoHome({super.key});

  @override
  Widget build(BuildContext context) {
    final isHover = context.watch<MenuDrawerProvider>().isHover;
    return Expanded(
      child: Transform.rotate(
        angle: -math.pi / 2,
        child: SizedBox(
          width: double.infinity,
          child: isHover
              ? const Image(
                  image: AssetImage('assets/img/logo.png'),
                )
              : const Text(''),
        ),
      ),
    );
  }
}
