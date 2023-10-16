import 'package:flutter/material.dart';

List<String> categorias = [
  'Usuarios',
  'Centros de Distribución',
  'Productos',
  'Entradas y salidas',
  'Configuraciónes'
];

class NavegacionDrawerProvider extends ChangeNotifier {
  late int _paginaActual = 0;

  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;
  String get nombreCategoria => categorias[_paginaActual];

  set paginaActual(int value) {
    _paginaActual = value;

    _pageController.animateToPage(
      value,
      curve: Curves.bounceIn,
      duration: const Duration(milliseconds: 250),
    );

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
