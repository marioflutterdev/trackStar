import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:trackstar_web/src/config/resposive/app_responsive.dart';

import '../../../provider/providers.dart';
import '../../../widgets/widgets.dart';
import '../widgets/widgets.dart';

class MenuLeft extends StatelessWidget {
  const MenuLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movile = AppResponsive.isLargeMobile(context);
    final setIsHovered = context.watch<MenuDrawerProvider>();
    return OnHoverCustomWidget(
      builder: (isHovered) {
        !movile ? setIsHovered.isHover = isHovered : false;
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
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
      width: isHovered ? 350 : 70,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.onPrimaryContainer,
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
