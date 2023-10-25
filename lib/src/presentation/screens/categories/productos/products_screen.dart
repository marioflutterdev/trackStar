import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../config/config.dart';
import '../../../../data/data.dart';
import '../../../widgets/xencard_custom/xencard_custom.dart';
import '../../home/widgets/widgets.dart';
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
    final theme = Theme.of(context).colorScheme;
    final table = AppResponsive.isTablet(context);
    final desktop = AppResponsive.isDesktop(context);
    final movile = AppResponsive.isLargeMobile(context);
    return Stack(
      children: [
        Skeletonizer(
          enabled: productsData.loading,
          child: GridView.builder(
            itemCount: usersData.length,
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
              return InfoProducts(
                id: usersData[index].id,
                name: usersData[index].nameProduct,
                description: usersData[index].descriptionProduct,
                img: usersData[index].avatarUrl,
              );
            },
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: ButtonCustomHome(
            icon: Icons.add,
            onTap: () => showDialog(
              context: context,
              builder: (builder) => ScaffoldMessenger(
                child: Builder(
                  builder: (context) => Scaffold(
                    backgroundColor: Colors.transparent,
                    body: XenPopupCard(
                      cardBgColor: theme.background,
                      appBar: XenCardAppBar(
                        color: theme.background,
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            children: [
                              const Center(
                                child: FittedBox(
                                  child: Text(
                                    'Añadir Producto',
                                    style: TextStyle(fontSize: 45),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                      ),
                      body: const BodyFormProducts(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
