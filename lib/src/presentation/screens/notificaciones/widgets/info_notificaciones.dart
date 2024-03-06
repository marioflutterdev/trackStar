import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../widgets/widgets.dart';
import '../../home/widgets/widgets.dart';

class NotificationInfo extends StatelessWidget {
  final NotificaiconesSolicitudes notification;

  const NotificationInfo({Key? key, required this.notification})
      : super(key: key);

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
                          NetworkImage(notification.producto?.avatarUrl ?? ''),
                    ),
                  ),
                  Text(
                    notification.producto!.nameProduct,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('ID: ${notification.id}'),
                  Text('Cantidad: ${notification.cantidad}'),
                  // Buttom(
                  //   onPressed: () {},
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Buttom extends StatelessWidget {
  final void Function() onPressed;

  const Buttom({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCustomHome(
      icon: Icons.logout,
      onTap: () => showDialog(
        context: context,
        builder: (context) => _DialogLeave(
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class _DialogLeave extends StatelessWidget {
  final void Function() onPressed;
  const _DialogLeave({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CleanDialog(
      title: 'Solicitar El Producto',
      content: 'Estas Seguro de Esta Acción',
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: const TextStyle(
        fontSize: 16,
      ),
      actions: [
        CleanDialogActionButtons(
          actionTitle: 'Cancel',
          textColor: const Color(0XFFF50057),
          onPressed: () => Navigator.pop(context),
        ),
        CleanDialogActionButtons(
          actionTitle: 'Aceptar',
          textColor: const Color(0XFF27ae61),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
