import 'package:flutter/material.dart';

import '../../../api/api.dart';

class CreatedNewUser extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> createNewUser({
    required String name,
    String? lastName,
    String? address,
    String? documentUser,
    String? numUser,
    required String email,
    required String password,
    bool? superUser,
  }) async {
    loading = true;
    const String url = '/auth/v1/signup';

    final data = {
      "email": email,
      "password": password,
      "data": {
        "first_name": name,
        "last_name": lastName,
        "direccion": address,
        "num_cel": numUser,
        "documento": documentUser,
        "super_user": superUser,
      }
    };

    final res = await dio.post(url, data: data);

    if (res.statusCode == 200) {
      loading = false;
      return true;
    } else {
      loading = false;
      return false;
    }
  }
}
