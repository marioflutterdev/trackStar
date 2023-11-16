import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../../widgets/widgets.dart';
import 'body_form_edit_product.dart';

class InfoProducts extends StatelessWidget {
  final ProductsModel product;

  const InfoProducts({
    super.key,
    required this.product,
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
                      backgroundImage: NetworkImage(product.avatarUrl ?? ''),
                    ),
                  ),
                  Text(
                    product.nameProduct,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('ID: ${product.id}'),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Text(product.descriptionProduct),
                  ),
                ],
              ),
              Positioned(
                top: 5,
                right: 0,
                child: _MenuButton(product: product),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatefulWidget {
  final ProductsModel product;

  const _MenuButton({
    super.key,
    required this.product,
  });

  @override
  State<_MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<_MenuButton> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
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
            child: FormFuncion(
              title: 'Editar Producto \'${widget.product.nameProduct}\' ',
              icon: Icons.edit,
              child: BodyFormEditProducts(
                product: widget.product,
              ),
            ),
          ),
        ),
        Visibility(
          visible: _visible,
          child: FadeInLeft(
            from: 50,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ),
        ),
      ],
    );
  }
}
