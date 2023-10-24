import 'package:flutter/material.dart';

import '../../../api/api.dart';

class CreatedNewUser extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> createNewUser(
    String name,
    String email,
    String password,
    bool superUser,
    String description,
  ) async {
    loading = true;
    const String url = '/auth/v1/signup';

    final data = {
      "email": email,
      "password": password,
      "data": {
        "full_name": name,
        "super_user": superUser,
        "description_user": description,
      }
    };

    final res = await dio.post(url, data: data);

    if (res.statusCode == 200) {
      print(res.data);
      loading = false;
      return true;
    } else {
      print(res.data);
      loading = false;
      return false;
    }
  }
}
