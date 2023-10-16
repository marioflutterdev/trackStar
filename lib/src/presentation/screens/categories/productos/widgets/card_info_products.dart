import 'package:flutter/material.dart';

class CardInfoProducts extends StatelessWidget {
  const CardInfoProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
