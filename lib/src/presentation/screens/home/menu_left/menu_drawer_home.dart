import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../provider/providers.dart';
import '../../../widgets/widgets.dart';
import '../widgets/widgets.dart';

class MenuLeft extends StatelessWidget {
  const MenuLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final setIsHovered = context.watch<MenuDrawerProvider>();
    return OnHoverCustomWidget(
      builder: (isHovered) {
        setIsHovered.isHover = isHovered;
        return const _ViewMenuLeft();
      },
    );
  }
}

class _ViewMenuLeft extends StatelessWidget {
  const _ViewMenuLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = context.watch<MenuDrawerProvider>().isHover;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      width: isHovered ? size.width * .18 : 70,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff56AEFF),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(10, 10),
          )
        ],
      ),
      child: const Column(
        children: [
          LogoHome(),
          ButtonHome(),
        ],
      ),
    );
  }
}
