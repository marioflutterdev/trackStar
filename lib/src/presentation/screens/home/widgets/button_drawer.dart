
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import '../../../../data/data.dart';
import '../../../../provider/providers.dart';
import '../../../widgets/widgets.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuController = context.watch<NavegacionDrawerProvider>();
    final cart = context.watch<GetCartProducts>();
    final user = context.watch<LoginAuthProvider>().user;
    return Column(
      children: [
        FadeInLeft(
          from: 50,
          child: ButtomCustom(
              icon: Icons.person,
              title: 'Usuarios',
              opTap: () => menuController.paginaActual = 0,
              colors: selectColor(menuController, 0)),
        ),
        FadeInLeft(
          from: 150,
          child: ButtomCustom(
            icon: Icons.production_quantity_limits,
            title: 'Productos',
            opTap: () => menuController.paginaActual = 1,
            colors: selectColor(menuController, 1),
          ),
        ),
        FadeInLeft(
          from: 100,
          child: ButtomCustom(
            icon: Icons.directions_bus_filled_outlined,
            title: 'C. Distribucion',
            opTap: () => menuController.paginaActual = 2,
            colors: selectColor(menuController, 2),
          ),
        ),
        FadeInLeft(
          from: 250,
          child: ButtomCustom(
            icon: Icons.shopping_cart,
            title: 'Carrito',
            opTap: () {
              menuController.paginaActual = 3;
              cart.getCart(user!);
            },
            colors: selectColor(menuController, 3),
          ),
        ),
        FadeInLeft(
          from: 250,
          child: ButtomCustom(
            icon: Icons.list_alt,
            title: 'Solicitudes',
            opTap: () => menuController.paginaActual = 4,
            colors: selectColor(menuController, 4),
          ),
        ),
        FadeInLeft(
          from: 250,
          child: ButtomCustom(
            icon: Icons.notifications,
            title: 'Notificaciones',
            opTap: () => menuController.paginaActual = 5,
            colors: selectColor(menuController, 5),
          ),
        ),
      ],
    );
  }

  selectColor(NavegacionDrawerProvider menuController, int v) {
    return menuController.paginaActual == v
        ? [
            Colors.black,
            Colors.white,
          ]
        : null;
  }
}

class ButtomCustom extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? opTap;
  final List<Color>? colors;
  const ButtomCustom({
    Key? key,
    required this.icon,
    required this.title,
    this.colors,
    this.opTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHovered = context.watch<MenuDrawerProvider>().isHover;
    return GestureDetector(
      onTap: opTap,
      child: _BackgraundButtom(
        icon: icon,
        colors: colors ??
            [
              Colors.black38,
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
