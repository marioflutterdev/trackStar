// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../../config/helpers/alert_auth.dart';
import '../../../widgets/widgets.dart';

class InfoCart extends StatelessWidget {
  final CartModel cart;

  const InfoCart({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<LoginAuthProvider>().user;
    final solicitudes = context.watch<AddSolicitudes>();
    final notificaciones = context.watch<AddNotificaciones>();
    final pedidos = context.watch<AddPedido>();

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
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textCustom(
                    title: 'Pertenece',
                    value: cart.centerModel?.nameCenter,
                  ),
                  textCustom(
                    title: 'Cantidad',
                    value: cart.quantity.toString(),
                  ),
                  ButtonWidget(
                    icon: Icons.check,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => YesOrNotWidget(
                        title: '¿Deseas solicitar este producto?',
                        onPressed: () async {
                          final data = await pedidos.addPedidos();

                          if (data != false) {
                            final pedidosStatus =
                                await solicitudes.addSolicitudes(
                              idSolicitudes: pedidos.uuidSolicitudes,
                              center: user?.user.userMetadata.center,
                              idProduct: cart.product.id,
                              quantity: cart.quantity,
                              nombreCenterPertenece:
                                  cart.centerModel?.nameCenter,
                            );
                            final notificacionesStatus =
                                await notificaciones.addNotificaciones(
                              idNotificaciones: pedidos.uuidNotificaciones,
                              center: cart.centerModel?.id,
                              idProduct: cart.product.id,
                              quantity: cart.quantity,
                              centroNotificado: cart.centerModel?.nameCenter,
                            );

                            if (pedidosStatus && notificacionesStatus) {
                              deleteProducts.delateCart(cart.id);
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                getProducts.getCart(user!);
                              });
                              context.pop(context);
                            }
                          }
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

  Row textCustom({String? title, String? value}) {
    return Row(
      children: [
        Text('$title: ', style: const TextStyle(fontSize: 20)),
        Text(value ?? 'no data', style: const TextStyle(fontSize: 15)),
      ],
    );
  }
}
