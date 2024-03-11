import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../widgets/widgets.dart';

class InfoSolicitud extends StatelessWidget {
  final NotificacionesSolicitudesModel solicitud;

  const InfoSolicitud({Key? key, required this.solicitud}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CardInfoCustomWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          NetworkImage(solicitud.producto.avatarUrl ?? ''),
                    ),
                  ),
                  Text(
                    solicitud.producto.nameProduct,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Cantidad que solicita: ${solicitud.cantidad}'),
                  Text('centro a que pertenece: ${solicitud.nameCenter}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
