import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'userScreen',
        style: TextStyle(
          fontSize: 70,
        ),
      ),
    );
  }
}
