import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class LeaveLogin extends StatelessWidget {
  const LeaveLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnHoverCustomWidget(
      builder: (isHovered) {
        final color = isHovered ? const Color(0xff56AEFF) : Colors.grey;
        return GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (context) => CleanDialog(
              title: 'Cerrar Sesión',
              content: 'Estas Seguro de Esta Acción',
              backgroundColor: const Color(0XFFF9A826),
              titleTextStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              contentTextStyle:
                  const TextStyle(fontSize: 16, color: Colors.white),
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
            ),
          ),
          child: Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.fromLTRB(10, 15, 15, 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(5, 5),
                )
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.logout_rounded,
              ),
            ),
          ),
        );
      },
    );
  }
}
