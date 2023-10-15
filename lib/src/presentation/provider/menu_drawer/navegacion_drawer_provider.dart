import 'package:flutter/material.dart';

List<String> categorias = [
  'USUARIOS',
  'CENTROS DE DISTRIBUCION',
  'PRODUCTOS',
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
