//!Funciones de SnackBar alertas

import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/widgets/snackbar_custom.dart';

errorAlert(
  BuildContext context,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: SnackbarCustomWidget(),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

errorAlertCustom(
  BuildContext context,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: SnackbarCustomWidget(
        erroText: 'Advertencia',
        sudErroloText: 'Por favor completa todos los campos',
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

alertEmail(String? value, BuildContext context) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);
  if (value!.isEmpty || !regex.hasMatch(value)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SnackbarCustomWidget(
          erroText: 'Advertencia',
          sudErroloText: 'Esto no parece un correo',
          color: Colors.amber.shade900,
          svg: 'assets/svg/warning.svg',
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
    return '   Corrige este campo';
  }
  return null;
}

passwordAlert(String? value, BuildContext context) {
  if (value == null || value.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SnackbarCustomWidget(
          erroText: 'Advertencia',
          sudErroloText: 'Contraseña debe ser mayor o igual a 6 caracteres.',
          color: Colors.amber.shade900,
          svg: 'assets/svg/warning.svg',
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
    return '   Corrige este campo';
  }
  return null;
}

resetPassaword(BuildContext context, String sudErroloTex) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SnackbarCustomWidget(
        erroText: 'SUPER',
        sudErroloText: sudErroloTex,
        color: Colors.greenAccent.shade700,
        svg: 'assets/svg/good.svg',
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

soloNumeros(v) {
  if (v!.contains(
    RegExp(r'[a-zA-Z]'),
  )) {
    return "Solo se permiten numeros";
  }
  return null;
}
