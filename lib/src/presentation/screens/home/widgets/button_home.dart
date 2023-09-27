import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

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
            title: 'Centros Distribucion',
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
    return _BackgraundButtom(
      icon: icon,
      colors: colors ??
          [
            const Color.fromARGB(255, 59, 199, 255),
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
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 40,
                color: Colors.white,
              ),
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
        final Color color = isHovered ? Colors.white : Colors.black38;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          width: double.infinity,
          height: 100,
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
                  right: -20,
                  top: -20,
                  child: Icon(
                    icon,
                    size: 150,
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
