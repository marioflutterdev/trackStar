import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../data/data.dart';
import '../../../../provider/providers.dart';
import '../../../../widgets/widgets.dart';
import 'body_form_edit_center.dart';

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
                        backgroundImage: center.avatarUrl != null
                            ? NetworkImage(center.avatarUrl!)
                            : const AssetImage('assets/img/no-image.jpg')
                                as ImageProvider),
                  ),
                  Text(
                    ' ${center.nameCenter}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textCustom(center.addressCenter, title: 'Dirección'),
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
                child: _MenuButton(center: center),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row textCustom(String? value, {String? title}) {
    const TextStyle textStyles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
    return Row(
      children: [
        Text('$title: ', style: textStyles),
        Text(value ?? 'no data'),
      ],
    );
  }
}

class _MenuButton extends StatefulWidget {
  final CenterModel center;

  const _MenuButton({
    super.key,
    required this.center,
  });

  @override
  State<_MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<_MenuButton> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    final menuController = context.watch<NavegacionDrawerProvider>();
    final deleteCenter = context.watch<DeleteCenter>();
    final getCenter = context.watch<GetCenterDistribution>();
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
                menuController.inventory = widget.center.inventory;
                menuController.paginaActual = 7;
              },
              icon: const Icon(Icons.shopping_basket_outlined),
            ),
          ),
        ),
        Visibility(
          visible: _visible,
          child: FadeInLeft(
            from: 50,
            child: IconButton(
              onPressed: () {
                menuController.paginaActual = 8;
              },
              icon: const Icon(Icons.local_shipping),
            ),
          ),
        ),
        Visibility(
          visible: _visible,
          child: FadeInLeft(
            from: 60,
            child: FormFuncion(
              title: 'Editar Centro \'${widget.center.nameCenter}\' ',
              icon: Icons.edit,
              child: BodyFormEditCenter(
                center: widget.center,
              ),
            ),
          ),
        ),
        Visibility(
          visible: _visible,
          child: FadeInLeft(
            from: 70,
            child: DelateItemWidget(
              onPressed: () {
                deleteCenter.delateCenter(widget.center.id);
                Future.delayed(const Duration(milliseconds: 500), () {
                  getCenter.getCenter();
                });
                context.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
