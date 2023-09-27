import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class BackGroundAuth extends StatelessWidget {
  const BackGroundAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -550,
          left: -600,
          child: FadeInLeft(
              duration: const Duration(seconds: 2),
              child: const _Dot(size: 1500)),
        ),
        Positioned(
          bottom: 50,
          right: -150,
          child: FadeInRight(
              duration: const Duration(seconds: 2),
              child: const _Dot(size: 500)),
        ),
        Positioned(
          bottom: 50,
          left: 50,
          child: FadeInRight(
              duration: const Duration(seconds: 2),
              child: SvgPicture.asset('assets/svg/img2.svg')),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final double size;

  const _Dot({
    super.key,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xff56AEFF),
        shape: BoxShape.circle,
      ),
    );
  }
}
