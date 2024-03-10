import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../widgets/widgets.dart';

class NotificationInfo extends StatelessWidget {
  final NotificacionesSolicitudesModel notificationes;

  const NotificationInfo({
    Key? key,
    required this.notificationes,
  }) : super(key: key);

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
                      backgroundImage: NetworkImage(
                          notificationes.pedido.producto.avatarUrl ?? ''),
                    ),
                  ),
                  Text(
                    notificationes.pedido.producto.nameProduct,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Fecha: ${notificationes.pedido.createdAt}'),
                  Text('Cantidad: ${notificationes.pedido.cantidad}'),
                  Text(
                      'centro que lo solicita: ${notificationes.pedido.idSolicitud?.centro.nameCenter}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
