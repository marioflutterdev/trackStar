import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/screens/home/widgets/widgets.dart';

class MenuLeft extends StatelessWidget {
  const MenuLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(30),
      width: size.width * .25,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff56AEFF),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(10, 10),
          )
        ],
      ),
      child: const _ViewMenuLeft(),
    );
  }
}

class _ViewMenuLeft extends StatelessWidget {
  const _ViewMenuLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LogoHome(),
        ButtonHome(),
      ],
    );
  }
}
