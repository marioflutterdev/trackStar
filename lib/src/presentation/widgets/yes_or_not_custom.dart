import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

class YesOrNotWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final String? content;
  const YesOrNotWidget({
    super.key,
    required this.onPressed,
    this.title,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return CleanDialog(
      title: title ?? 'coloca un titulo',
      content: content ?? '',
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
