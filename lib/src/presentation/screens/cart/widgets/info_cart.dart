import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/data/data.dart';
import 'package:trackstar_web/src/presentation/screens/home/widgets/widgets.dart';

import '../../../widgets/widgets.dart';

class InfoCart extends StatelessWidget {
  final CartModel cart;

  const InfoCart({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =
        context.watch<LoginAuthProvider>().user!.user.userMetadata.center;
    final solicitudes = context.watch<AddSolicitudes>();
    final notification = context.watch<AddNotificaciones>();
    final getSolicitude = context.watch<GetSolicitudes>();
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
                          NetworkImage(cart.product.avatarUrl ?? ''),
                    ),
                  ),
                  Text(
                    cart.product.nameProduct,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('ID: ${cart.id}'),
                  Text('Cantidad: ${cart.quantity}'),
                  Buttom(
                    onPressed: () {
                      solicitudes.addSolicitudes(
                        center: user,
                        centerPertenece: cart.centerPertenece,
                        idProduct: cart.product.id,
                        quantity: cart.quantity,
                      );
                      notification.addNotificaciones(
                        center: cart.center,
                        centerPertenece: cart.centerPertenece,
                        idProduct: cart.product.id,
                        quantity: cart.quantity,
                      );
                      getSolicitude.getSolicitudes();
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
