import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackstar_web/src/presentation/widgets/hover_custom.dart';

class LabelsAuth extends StatelessWidget {
  final String route;
  final String? textLabel;
  final String? subTextLabel;

  const LabelsAuth({
    super.key,
    required this.route,
    this.textLabel,
    this.subTextLabel,
  });

  @override
  Widget build(BuildContext context) {
    return OnHoverCustomWidget(
      builder: (isHovered) => GestureDetector(
        onTap: () => context.go(route),
        child: Column(
          children: [
            Text(
              textLabel ?? '',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subTextLabel ?? '',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
