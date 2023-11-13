import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/models/categorys/user_model/user_model.dart';

import '../../../api/api.dart';

class CreatedNewUser extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> createNewUser({
    required UsersGetModel dataUser,
    required String password,
  }) async {
    loading = true;
    const String url = '/auth/v1/signup';

    final data = {
      "email": dataUser.email,
      "password": password,
      "data": {
        "first_name": dataUser.firstName,
        "last_name": dataUser.lastName,
        "address_profile": dataUser.addressProfile,
        "phone_number": dataUser.phoneNumber,
        "document_profile": dataUser.documentProfile,
        "super_user": dataUser.superUser,
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
