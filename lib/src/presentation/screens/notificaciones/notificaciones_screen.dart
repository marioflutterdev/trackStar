import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/config/resposive/responsive_funtion.dart';
import 'package:trackstar_web/src/data/datasource/solicitudes_notificaciones/get_notificaiones.dart';

import 'widgets/info_notificaciones.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = context.watch<GetNotificaciones>();
    return Stack(
      children: [
        Skeletonizer(
          enabled: notifications.loading,
          child: GridView.builder(
            itemCount: notifications.notificaciones.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsiveGrip(context),
              mainAxisExtent: 400,
            ),
            itemBuilder: (BuildContext context, int index) {
              return NotificationInfo(
                notification: notifications.notificaciones[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
