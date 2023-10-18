import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class InfoUser extends StatelessWidget {
  final String img;
  final String name;
  final int edad;
  final String genero;
  final String descripcion;

  const InfoUser(
      {Key? key,
      required this.img,
      required this.name,
      required this.edad,
      required this.genero,
      required this.descripcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CardInfoCustomWidget(child: const Text('hola')),
    );
  }
}
