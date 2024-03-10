import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:trackstar_web/src/presentation/screens/home/info_user/info_user.dart';

import '../../../../provider/providers.dart';

class LogoHome extends StatelessWidget {
  const LogoHome({super.key});

  @override
  Widget build(BuildContext context) {
    final isHover = context.watch<MenuDrawerProvider>().isHover;
    return isHover
        ? const Expanded(
            child: SizedBox(
              width: double.infinity,
              child: InfoUserDawer(),
            ),
          )
        : Expanded(
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: SizedBox(
                width: double.infinity,
                child: isHover ? const Text('') : const Text('TRACKSTAR SAS'),
              ),
            ),
          );
  }
}
