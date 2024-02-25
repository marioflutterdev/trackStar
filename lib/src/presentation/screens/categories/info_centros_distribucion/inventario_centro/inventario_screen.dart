import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trackstar_web/src/data/data.dart';
import 'package:trackstar_web/src/presentation/screens/categories/info_centros_distribucion/inventario_centro/widgets/info_inventario.dart';

import '../../../../../config/resposive/responsive_funtion.dart';
import '../../../../provider/providers.dart';
import '../../../../widgets/widgets.dart';
import '../../user/widgets/body_form_user.dart';

class InventarioScreen extends StatefulWidget {
  final List<InventoryModel>? inventory;
  const InventarioScreen({
    Key? key,
    this.inventory,
  }) : super(key: key);

  @override
  State<InventarioScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<InventarioScreen> {
  @override
  Widget build(BuildContext context) {
    final menuController = context.watch<NavegacionDrawerProvider>();
    return Stack(
      children: [
        GridView.builder(
          itemCount: widget.inventory!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: responsiveGrip(context),
            mainAxisExtent: 400,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InfoInventy(
              inventory: widget.inventory![index],
            );
          },
        ),
        Positioned(
          top: 30,
          left: 30,
          child: IconButton(
            onPressed: () {
              menuController.paginaActual = 2;
            },
            icon: const Icon(Icons.arrow_back),
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
