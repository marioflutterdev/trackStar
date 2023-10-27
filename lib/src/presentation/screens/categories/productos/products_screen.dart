import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

import '../../../../config/resposive/responsive_funtion.dart';
import '../../../../data/data.dart';
import 'widgets/body_form_products.dart';
import 'widgets/info_products.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<GetProducts>(context);
    final List<ProductsModel> usersData = productsData.products;

    return Stack(
      children: [
        Skeletonizer(
          enabled: productsData.loading,
          child: GridView.builder(
            itemCount: usersData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsiveGrip(context),
              mainAxisExtent: 400,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InfoProducts(
                id: usersData[index].id,
                name: usersData[index].nameProduct,
                description: usersData[index].descriptionProduct,
                img: usersData[index].avatarUrl,
              );
            },
          ),
        ),
        const Positioned(
          bottom: 30,
          right: 30,
          child: BodyUpdateItemCustomWidget(
            title: 'Add Product',
            child: BodyFormProducts(),
          ),
        )
      ],
    );
  }
}
