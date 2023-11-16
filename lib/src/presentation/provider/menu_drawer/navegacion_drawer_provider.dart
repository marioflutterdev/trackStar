import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

List<String> categorias = [
  'Usuarios',
  'Productos',
  'Centros de Distribución',
  'Configuraciónes',
  'inventario',
  'Entradas y Salidas',
];

class NavegacionDrawerProvider extends ChangeNotifier {
  late int _paginaActual = 0;

  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;
  String get nombreCategoria => categorias[_paginaActual];

  List<Inventory>? _inventory;

  List<Inventory>? get inventory => _inventory;

  set inventory(List<Inventory>? value) {
    _inventory = value;
    notifyListeners();
  }

  set paginaActual(int value) {
    _paginaActual = value;

    _pageController.animateToPage(
      value,
      curve: Curves.bounceInOut,
      duration: const Duration(milliseconds: 10),
    );

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
