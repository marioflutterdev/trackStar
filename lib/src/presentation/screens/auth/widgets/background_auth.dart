import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:trackstar_web/src/config/resposive/app_responsive.dart';

class BackGroundAuth extends StatelessWidget {
  const BackGroundAuth({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final desktop = AppResponsive.isDesktop(context);
    final movile = AppResponsive.isLargeMobile(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        if (!movile)
          Positioned(
            top: -550,
            left: -700,
            child: FadeInLeft(
                duration: const Duration(seconds: 2),
                child: _Dot(size: desktop ? 1500 : 1100)),
          ),
        if (!movile)
          Positioned(
            bottom: -50,
            right: -150,
            child: FadeInRight(
                duration: const Duration(seconds: 2),
                child: const _Dot(size: 500)),
          ),
        if (!movile)
          Positioned(
            top: -300,
            right: -150,
            child: FadeInRight(
              duration: const Duration(seconds: 2),
              child: _Dot(size: desktop ? 700 : 600),
            ),
          ),
        if (!movile)
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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        shape: BoxShape.circle,
      ),
    );
  }
}
