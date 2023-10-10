import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> updatePassword(
      {String email = '', String newPassword = ''}) async {
    String url = '/auth/v1/user';

    Map data = {
      "email": email,
      "password": newPassword,
    };

    Response response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      print(response.data);
      return true;
    } else {
      print(response.data);
      return false;
    }
  }
}
