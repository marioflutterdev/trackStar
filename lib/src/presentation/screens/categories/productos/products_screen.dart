import 'package:flutter/material.dart';

import 'widgets/info_products.dart';
import '../../../../config/config.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final table = AppResponsive.isTablet(context);
    final desktop = AppResponsive.isDesktop(context);
    final movile = AppResponsive.isLargeMobile(context);
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: movile
            ? 1
            : table
                ? 3
                : desktop
                    ? 4
                    : 4,
        mainAxisExtent: 400,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const InfoProducts();
      },
    );
  }
}
