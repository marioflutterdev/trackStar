import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../api/api.dart';
import '../upload/upload_imagen.dart';

class CreatedNewUser extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  String _url = '';

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> createNewUser({
    required UsersGetModel dataUser,
    required String password,
    XFile? path,
  }) async {
    loading = true;
    const String url = '/auth/v1/signup';

    if (path != null) {
      final res = await addImage(path);
      _url = res;
    }

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
        "avatar_url": _url,
      }
    };

    final res = await dio.post(url, data: data);

    if (res.statusCode == 200) {
      loading = false;
      GetUser().getUser();
      return true;
    } else {
      loading = false;
      return false;
    }
  }
}
