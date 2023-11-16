import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/presentation/screens/categories/info_centros_distribucion/inventario_centro/inventario_screen.dart';

import '../../../../../data/data.dart';
import '../../../../provider/providers.dart';
import '../../../../widgets/widgets.dart';

class InfoCenter extends StatelessWidget {
  final CenterModel center;

  const InfoCenter({
    super.key,
    required this.center,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CardInfoCustomWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(center.avatarUrl),
                    ),
                  ),
                  Text(center.nameCenter),
                  Text(center.addressCenter),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Text(
                      center.descriptionCenter,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 5,
                right: 0,
                child: _MenuButton(inventory: center.inventory),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatefulWidget {
  final List<Inventory>? inventory;

  const _MenuButton({super.key, this.inventory});

  @override
  State<_MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<_MenuButton> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    final menuController = context.watch<NavegacionDrawerProvider>();
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          icon: Icon(!_visible ? Icons.menu : Icons.menu_open),
        ),
        Visibility(
          visible: _visible,
          child: FadeInLeft(
            from: 40,
            child: IconButton(
              onPressed: () {
                menuController.inventory = widget.inventory;
                menuController.paginaActual = 4;
              },
              icon: const Icon(Icons.production_quantity_limits),
            ),
          ),
        ),
        Visibility(
          visible: _visible,
          child: FadeInLeft(
            from: 50,
            child: IconButton(
              onPressed: () {
                menuController.paginaActual = 5;
              },
              icon: const Icon(Icons.car_rental_outlined),
            ),
          ),
        ),
        Visibility(
          visible: _visible,
          child: FadeInLeft(
            from: 60,
            child: IconButton(
              onPressed: () {
                //TODO editar centro
              },
              icon: const Icon(Icons.edit_note_sharp),
            ),
          ),
        ),
      ],
    );
  }
}
