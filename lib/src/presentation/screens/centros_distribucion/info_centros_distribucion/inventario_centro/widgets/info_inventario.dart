import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../../../widgets/widgets.dart';
import '../../../../cart/widgets/body_form_info.dart';

class InfoInventy extends StatelessWidget {
  final InventoryModel inventory;

  const InfoInventy({super.key, required this.inventory});

  @override
  Widget build(BuildContext context) {
    final center =
        Provider.of<LoginAuthProvider>(context).user!.user.userMetadata.center;
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
                      backgroundImage:
                          NetworkImage(inventory.product.avatarUrl ?? ''),
                    ),
                  ),
                  Text(
                    inventory.product.nameProduct,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('ID: ${inventory.id}'),
                  Text('Cantidad: ${inventory.quantity}'),
                  Text(
                    'Precio: ${inventory.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: inventory.center == center ? false : true,
                child: Positioned(
                  top: 5,
                  right: 0,
                  child: BodyUpdateItemCustomWidget(
                    title: 'agregar producto al carrito',
                    child: BodyFormAddCart(
                      product: inventory.product.id,
                      idCenterPertence: inventory.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
