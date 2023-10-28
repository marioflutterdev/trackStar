import 'package:flutter/material.dart';

class InventarioScreen extends StatelessWidget {
  const InventarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
      ),
      body: Center(
        child: Text('Inventario'),
      ),
    );
  }
}
