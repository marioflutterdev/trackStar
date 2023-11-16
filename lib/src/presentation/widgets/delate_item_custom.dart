import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

class DelateItemWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const DelateItemWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (builder) => ScaffoldMessenger(
          child: Builder(
            builder: (context) => Scaffold(
                backgroundColor: Colors.transparent,
                body: CleanDialog(
                  title: 'Estas Seguro de Eliminar',
                  content: 'Se eliminara permanentemente',
                  backgroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
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
                )),
          ),
        ),
      ),
      icon: const Icon(Icons.delete),
    );
  }
}
