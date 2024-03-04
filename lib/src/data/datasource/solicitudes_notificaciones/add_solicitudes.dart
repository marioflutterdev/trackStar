import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

class AddSolicitudes extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  get accessToken => null;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> addSolicitudes({
    final String? center,
    final String? idProduct,
    final String? centerPertenece,
    final int? quantity,
  }) async {
    loading = true;

    const String url = '/rest/v1/solicitudes';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "mi_centro": center,
      "producto": idProduct,
      "cantidad": quantity,
      "centro_peticion": centerPertenece
    };

    print(data);
    final res = await dio.post(url, data: data);
    print(res.statusCode);
    if (res.statusCode == 201) {
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
