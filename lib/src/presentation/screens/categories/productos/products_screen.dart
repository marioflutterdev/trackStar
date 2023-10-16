import 'package:flutter/material.dart';

import 'widgets/card_info_products.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(),
        ),
        const _ViewProducts(),
      ],
    );
  }
}

class _ViewProducts extends StatelessWidget {
  const _ViewProducts();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CardInfoProducts();
        },
      ),
    );
  }
}
