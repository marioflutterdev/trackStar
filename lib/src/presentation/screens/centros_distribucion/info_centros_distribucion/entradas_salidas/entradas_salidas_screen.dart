import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/screens/users/widgets/body_form_add_user.dart';
import 'package:trackstar_web/src/presentation/widgets/body_update_item.dart';

class EntradasSalidasScreen extends StatelessWidget {
  const EntradasSalidasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

        const Positioned(
          bottom: 30,
          right: 30,
          child: BodyUpdateItemCustomWidget(
            title: 'Agregar Centro de Distribución',
            //TODO agregar el formulario de entradas y salidas
            child: BodyFormAddUser(),
          ),
        )
      ],
    );
  }
}
