import 'package:flutter/material.dart';

import '../config.dart';

int responsiveGrip(BuildContext context) {
  final table = AppResponsive.isTablet(context);
  final desktop = AppResponsive.isDesktop(context);
  final movile = AppResponsive.isLargeMobile(context);

  return movile
      ? 1
      : table
          ? 3
          : desktop
              ? 4
              : 4;
}
