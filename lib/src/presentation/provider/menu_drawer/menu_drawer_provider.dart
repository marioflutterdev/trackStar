import 'package:flutter/material.dart';

class MenuDrawerProvider extends ChangeNotifier {
  late bool _isHover;

  bool get isHover => _isHover;

  set isHover(value) {
    _isHover = value;
    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }
}
