import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

class ResetPasswordProvider extends ChangeNotifier {
  static bool authenticated = false;

  Future<dynamic> resetPassword({String email = ''}) async {
    String url = '/auth/v1/recover';

    Map data = {
      "email": email,
    };

    Response response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      print('Respuesta: ${response.data}');
      notifyListeners();
      return true;
    } else {
      print('Mensaje de error: ${response.data['error_description']}');
      return false;
    }
  }
}
