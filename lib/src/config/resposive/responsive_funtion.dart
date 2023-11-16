import 'package:flutter/material.dart';

import '../config.dart';

//! Funcion para manejar el grip de los elementos de la lista

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
