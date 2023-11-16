import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

//? Provider para login de la aplicacion
class LoginAuthProvider extends ChangeNotifier {
  static bool authenticated = false;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  //! Funcion para hacer login en la aplicacion
  Future<dynamic> signUp({String email = '', String password = ''}) async {
    loading = true;

    String url = '/auth/v1/token?grant_type=password';
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };
    Response response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      authenticated = true;
      loading = false;
      notifyListeners();
      return true;
    } else {
      loading = false;
      notifyListeners();
      return false;
    }
  }
}
