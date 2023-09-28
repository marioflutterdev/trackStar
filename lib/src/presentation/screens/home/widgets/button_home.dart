import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import 'package:trackstar_web/src/presentation/widgets/widgets.dart';
import '../../../provider/providers.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInLeft(
          from: 50,
          child: const ButtomCustom(
            icon: Icons.person,
            title: 'Usuarios',
          ),
        ),
        FadeInLeft(
          from: 100,
          child: const ButtomCustom(
            icon: Icons.directions_bus_filled_outlined,
            title: 'C. Distribucion',
          ),
        ),
        FadeInLeft(
          from: 150,
          child: const ButtomCustom(
            icon: Icons.production_quantity_limits,
            title: 'Productos',
          ),
        ),
        FadeInLeft(
          from: 200,
          child: const ButtomCustom(
            icon: Icons.car_crash_outlined,
            title: 'Seguimiento',
          ),
        )
      ],
    );
  }
}

class ButtomCustom extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Color>? colors;
  const ButtomCustom({
    Key? key,
    required this.icon,
    required this.title,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHovered = context.watch<MenuDrawerProvider>().isHover;
    return _BackgraundButtom(
      icon: icon,
      colors: colors ??
          [
            Color.fromARGB(255, 3, 20, 27),
            Colors.grey,
          ],
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
                height: double.infinity,
              ),
              Icon(
                icon,
                size: isHovered ? 40 : 30,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              if (isHovered)
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              if (isHovered)
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 40,
                  color: Colors.white,
                ),
              if (isHovered)
                const SizedBox(
                  width: 10,
                ),
            ],
          )
        ],
      ),
    );
  }
}

class _BackgraundButtom extends StatelessWidget {
  final IconData icon;
  final List<Color> colors;
  final Widget child;

  const _BackgraundButtom({
    required this.child,
    required this.icon,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return OnHoverCustomWidget(
      builder: (isHovered) {
        final double blurRadius = isHovered ? 10 : 30;
        final Color color = isHovered ? Colors.grey : Colors.black38;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: color,
                offset: const Offset(4, 5),
                blurRadius: blurRadius,
              )
            ],
            gradient: LinearGradient(colors: colors),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  top: -10,
                  child: Icon(
                    icon,
                    size: 70,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                child
              ],
            ),
          ),
        );
      },
    );
  }
}
