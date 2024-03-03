import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:trackstar_web/src/data/api/api.dart';
import 'package:trackstar_web/src/data/datasource/upload/upload_imagen.dart';
import '../../data.dart';

class UploadUser extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  String _url = '';

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> uploadUser({
    required UsersGetModel dataUser,
    required String password,
    required String token,
    XFile? path,
  }) async {
    loading = true;
    const String url = '/auth/v1/user';

    if (path != null) {
      final res = await addImage(path);
      _url = res;
    }
    String accessToken = 'Bearer $token';
    dio.options.headers['Authorization'] = ' $accessToken';

    final data = {
      "email": dataUser.email,
      "password": password,
      "data": {
        "first_name": dataUser.firstName,
        "last_name": dataUser.lastName,
        "address_profile": dataUser.addressProfile,
        "phone_number": dataUser.phoneNumber,
        "document_profile": dataUser.documentProfile,
        "avatar_url": _url,
      }
    };

    final res = await dio.put(url, data: data);
    print(res.data);
    print(res.statusCode);
    if (res.statusCode == 200) {
      print(res.data);
      loading = false;
      GetUser().getUser();
      return true;
    } else {
      print(res.data);
      loading = false;
      return false;
    }
  }
}
