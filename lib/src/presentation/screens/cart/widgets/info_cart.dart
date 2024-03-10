import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../widgets/widgets.dart';

class InfoCart extends StatelessWidget {
  final CartModel cart;

  const InfoCart({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<LoginAuthProvider>().user;
    //final solicitudes = context.watch<AddSolicitudes>();
    //final notification = context.watch<AddNotificaciones>();
    //final getSolicitude = context.watch<GetSolicitudes>();
    final getProducts = context.watch<GetCartProducts>();
    final deleteProducts = context.watch<DeleteCart>();
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
                  ButtonWidget(
                    icon: Icons.check,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => YesOrNotWidget(
                        title: '¿Deseas solicitar este producto?',
                        onPressed: () {
                          /* solicitudes.addSolicitudes(
                            center: user.user?.user.userMetadata.center,
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
                          Navigator.pop(context); */
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: ButtonWidget(
                  icon: Icons.delete,
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => YesOrNotWidget(
                      title: '¿Deseas eliminar este producto?',
                      onPressed: () async {
                        deleteProducts.delateCart(cart.id);
                        Future.delayed(const Duration(milliseconds: 500), () {
                          getProducts.getCart(user!);
                        });
                        context.pop(context);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
