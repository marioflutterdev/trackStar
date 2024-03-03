import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/config/resposive/responsive_funtion.dart';
import 'package:trackstar_web/src/presentation/screens/productos/widgets/body_form_add_products.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

import '../../../../../../data/data.dart';

class SearchProductsView extends StatefulWidget {
  const SearchProductsView({Key? key}) : super(key: key);

  @override
  State<SearchProductsView> createState() => _UserScreenState();
}

class _UserScreenState extends State<SearchProductsView> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<GetProducts>(context);
    final List<ProductsModel> productData = productsData.products;

    return Stack(
      children: [
        Skeletonizer(
          enabled: productsData.loading,
          child: GridView.builder(
            itemCount: productData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsiveGrip(context),
              mainAxisExtent: 300,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 300,
                width: 300,
                color: Colors.red,
              );
            },
          ),
        ),
        const Positioned(
          bottom: 30,
          right: 30,
          child: BodyUpdateItemCustomWidget(
            title: 'Agregar Producto',
            child: BodyFormAddProducts(),
          ),
        )
      ],
    );
  }
}
