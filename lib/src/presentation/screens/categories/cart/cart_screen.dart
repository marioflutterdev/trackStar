import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/config/resposive/responsive_funtion.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

import '../../../../data/data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<GetCartProducts>();
    return Stack(
      children: [
        Skeletonizer(
          enabled: cart.loading,
          child: GridView.builder(
            itemCount: cart.cartProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsiveGrip(context),
              mainAxisExtent: 400,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InfoCart(
                cart: cart.cartProducts[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

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
