import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/presentation/provider/menu_drawer/navegacion_drawer_provider.dart';
import 'package:trackstar_web/src/presentation/screens/categories/user/widgets/body_form_user.dart';
import 'package:trackstar_web/src/presentation/widgets/body_update_item.dart';

class EntradasSalidasScreen extends StatelessWidget {
  const EntradasSalidasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuController = context.watch<NavegacionDrawerProvider>();
    return Stack(
      children: [
        /* GridView.builder(
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
        ), */

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
            //TODO agregar el formulario de entradas y salidas
            child: BodyFormUser(),
          ),
        )
      ],
    );
  }
}
