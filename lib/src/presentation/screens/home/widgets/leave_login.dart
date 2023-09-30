import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/screens/home/widgets/widgets.dart';

import '../../../widgets/widgets.dart';

class LeaveLogin extends StatelessWidget {
  const LeaveLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCustomHome(
      icon: Icons.logout,
      onTap: () => showDialog(
        context: context,
        builder: (context) => const _DialogLeave(),
      ),
    );
  }
}

class _DialogLeave extends StatelessWidget {
  const _DialogLeave({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CleanDialog(
      title: 'Cerrar Sesión',
      content: 'Estas Seguro de Esta Acción',
      backgroundColor: const Color(0XFFF9A826),
      titleTextStyle: const TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      actions: [
        CleanDialogActionButtons(
          actionTitle: 'Cancel',
          textColor: const Color(0XFFF50057),
          onPressed: () => Navigator.pop(context),
        ),
        CleanDialogActionButtons(
          actionTitle: 'Aceptar',
          textColor: const Color(0XFF27ae61),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
