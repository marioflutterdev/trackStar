import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

class AddNotificaciones extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  get accessToken => null;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> addNotificaciones({
    final String? center,
    final String? idProduct,
    final String? centerPertenece,
    final int? quantity,
  }) async {
    loading = true;

    const String url = '/rest/v1/notificaciones';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "mi_centro": center,
      "producto": idProduct,
      "cantidad": quantity,
      "centro_peticion": centerPertenece
    };

    final res = await dio.post(url, data: data);

    if (res.statusCode == 201) {
      loading = false;
      return true;
    } else {
      loading = false;
      return false;
    }
  }
}
