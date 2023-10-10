// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

class LoginAuthProvider extends ChangeNotifier {
  static bool authenticated = false;

  Future<dynamic> signUp({String email = '', String password = ''}) async {
    String url = '/auth/v1/token?grant_type=password';

    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };
    Response response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      authenticated = true;
      print('Respuesta: ${response.data}');
      notifyListeners();
      return true;
    } else {
      print('Mensaje de error: ${response.data['error_description']}');
      return false;
    }
  }
}
