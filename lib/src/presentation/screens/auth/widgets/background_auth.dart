import 'package:flutter/material.dart';

class BackGroundAuth extends StatelessWidget {
  const BackGroundAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: -50,
          left: -100,
          child: _Dot(),
        ),
        Positioned(
          top: -50,
          left: -130,
          child: _Dot(),
        ),
        Positioned(
          bottom: 50,
          right: -150,
          child: _Dot(),
        ),
        Positioned(
          top: 100,
          right: -130,
          child: _Dot(),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        color: Color(0xff01091D),
        shape: BoxShape.circle,
      ),
    );
  }
}
