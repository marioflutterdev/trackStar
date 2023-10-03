import 'package:flutter/material.dart';

class NavegacionDrawerProvider extends ChangeNotifier {
  int _paginaActual = 0;

  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

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
