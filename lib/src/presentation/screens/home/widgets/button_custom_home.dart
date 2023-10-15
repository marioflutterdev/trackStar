import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ButtonCustomHome extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  const ButtonCustomHome({
    super.key,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OnHoverCustomWidget(
      builder: (isHovered) {
        final color = isHovered
            ? Colors.grey
            : Theme.of(context).colorScheme.onPrimaryContainer;
        return GestureDetector(
          onTap: onTap,
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
            child: Center(
              child: Icon(
                icon ?? Icons.question_mark_sharp,
              ),
            ),
          ),
        );
      },
    );
  }
}
