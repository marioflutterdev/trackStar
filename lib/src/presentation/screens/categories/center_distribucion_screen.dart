import 'package:flutter/material.dart';

class CenterDistribucionScreen extends StatelessWidget {
  const CenterDistribucionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'center of distribution',
        style: TextStyle(
          fontSize: 70,
        ),
      ),
    );
  }
}
