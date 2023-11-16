import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../../../widgets/widgets.dart';

class InfoInventy extends StatelessWidget {
  final InventoryModel inventory;

  const InfoInventy({super.key, required this.inventory});

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
            ],
          ),
        ),
      ),
    );
  }
}
