import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/data/data.dart';
import 'package:trackstar_web/src/presentation/screens/categories/info_centros_distribucion/inventario_centro/widgets/info_inventario.dart';

import '../../../../../config/resposive/responsive_funtion.dart';
import '../../../../widgets/widgets.dart';
import '../../user/widgets/body_form_user.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({Key? key}) : super(key: key);

  @override
  State<InventarioScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<InventarioScreen> {
  @override
  Widget build(BuildContext context) {
    final inventoryProvider = Provider.of<GetInventory>(context);
    final List<InventoryModel> inventoryData = inventoryProvider.inventory;
    return Stack(
      children: [
        Skeletonizer(
          enabled: inventoryProvider.loading,
          child: GridView.builder(
            itemCount: inventoryData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsiveGrip(context),
              mainAxisExtent: 400,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InfoInventy(
                id: inventoryData[index].id,
                nameProduct: inventoryData[index].nameProduct,
                img: inventoryData[index].img,
                quantity: inventoryData[index].quantity,
                price: inventoryData[index].price,
              );
            },
          ),
        ),
        const Positioned(
          bottom: 30,
          right: 30,
          child: BodyUpdateItemCustomWidget(
            title: 'Agregar Centro de Distribución',
            //TODO agregar el formulario de Inventarios
            child: BodyFormUser(),
          ),
        )
      ],
    );
  }
}
