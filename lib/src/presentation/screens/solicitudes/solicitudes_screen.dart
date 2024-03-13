import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/config/resposive/responsive_funtion.dart';
import 'package:trackstar_web/src/data/datasource/notificaicones/get_solicitudes.dart';
import 'package:trackstar_web/src/presentation/screens/solicitudes/widgets/info_solucitudes.dart';

class SolicitudesScreen extends StatelessWidget {
  const SolicitudesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final solicitudes = context.watch<GetSolicitudes>();
    return Stack(
      children: [
        Skeletonizer(
          enabled: solicitudes.loading,
          child: GridView.builder(
            itemCount: solicitudes.solicitudes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsiveGrip(context),
              mainAxisExtent: 400,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InfoSolicitud(
                solicitud: solicitudes.solicitudes[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
