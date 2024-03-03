import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../../widgets/widgets.dart';

class InfoCart extends StatelessWidget {
  final CartModel cart;

  const InfoCart({Key? key, required this.cart}) : super(key: key);

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
                          NetworkImage(cart.product.avatarUrl ?? ''),
                    ),
                  ),
                  Text(
                    cart.product.nameProduct,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('ID: ${cart.id}'),
                  Text('Cantidad: ${cart.quantity}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
