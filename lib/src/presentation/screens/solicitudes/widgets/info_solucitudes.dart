import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import '../../../widgets/widgets.dart';
import '../../home/widgets/widgets.dart';

class InfoSolicitud extends StatelessWidget {
  final NotificaiconesSolicitudes solicitud;

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
                  Text('ID: ${solicitud.id}'),
                  Text('Cantidad: ${solicitud.cantidad}'),
                  Buttom(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
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
      title: 'Anular La Solicitud',
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
