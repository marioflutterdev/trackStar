import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

//? Provider para Resetpassword de la aplicacion
class ResetPasswordProvider extends ChangeNotifier {
  static bool authenticated = false;
  final String? accessToken;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  ResetPasswordProvider({this.accessToken});

  //! Funcion para hacer resetpassword en la aplicacion

  Future<dynamic> resetPassword({
    String email = '',
  }) async {
    loading = true;
    String url = '/auth/v1/recover';

    Map data = {
      "email": email,
    };

    Response response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      loading = false;
      notifyListeners();
      return true;
    } else {
      loading = false;
      notifyListeners();
      return false;
    }
  }

  //! Funcion para hacer updatepassword en la aplicacion

  Future<dynamic> updatePassword({
    String email = '',
    String newPassword = '',
  }) async {
    loading = true;
    String url = '/auth/v1/user';

    final token = 'Bearer $accessToken';

    dio.options.headers['Authorization'] = token;

    Map data = {
      "email": email,
      "password": newPassword,
    };

    Response response = await dio.put(url, data: data);

    if (response.statusCode == 200) {
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
