import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

List<String> categorias = [
  'Usuarios',
  'Productos',
  'Centros de Distribución',
  'Carrito',
  'Solicitudes',
  'Notificaciones',
  'Configuraciónes',
  'inventario',
  'Entradas y Salidas',
];

class NavegacionDrawerProvider extends ChangeNotifier {
  late int _paginaActual = 0;

  List<InventoryModel>? _inventory;

  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  String get nombreCategoria => categorias[_paginaActual];

  List<InventoryModel>? get inventory => _inventory;

  set inventory(List<InventoryModel>? value) {
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
