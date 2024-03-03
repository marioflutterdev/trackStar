import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/config/resposive/responsive_funtion.dart';

import '../../../data/data.dart';
import 'widgets/info_cart.dart';

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
