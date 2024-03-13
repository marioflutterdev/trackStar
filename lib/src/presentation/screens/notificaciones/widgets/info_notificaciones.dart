import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../widgets/widgets.dart';

class NotificationInfo extends StatelessWidget {
  final NotificacionesModel notificationes;

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
                      backgroundImage:
                          NetworkImage(notificationes.producto.avatarUrl ?? ''),
                    ),
                  ),
                  Text(
                    notificationes.producto.nameProduct,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textCustom(
                    title: 'Unidades Solicitadas: ',
                    value: notificationes.cantidad.toString(),
                  ),
                  textCustom(
                    value: notificationes.nameCenter,
                    title: 'Centro Solicitante: ',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row textCustom({String? title, String? value}) {
    return Row(
      children: [
        Text(title ?? 'no data', style: const TextStyle(fontSize: 20)),
        Text(value ?? 'no data', style: const TextStyle(fontSize: 15)),
      ],
    );
  }
}
