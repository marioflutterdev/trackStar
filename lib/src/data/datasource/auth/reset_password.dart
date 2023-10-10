import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

class ResetPasswordProvider extends ChangeNotifier {
  static bool authenticated = false;
  // ignore: prefer_typing_uninitialized_variables
  final String? accessToken;

  ResetPasswordProvider({this.accessToken});

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

    final token = 'Bearer $accessToken';

    dio.options.headers['Authorization'] = token;

    Map data = {
      "email": email,
      "password": newPassword,
    };

    Response response = await dio.put(url, data: data);

    if (response.statusCode == 200) {
      print(response.data);
      return true;
    } else {
      print(response.data);
      return false;
    }
  }
}
