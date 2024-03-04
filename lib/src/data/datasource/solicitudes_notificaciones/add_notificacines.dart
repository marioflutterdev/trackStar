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
    final int? quantity,
  }) async {
    loading = true;

    const String url = '/rest/v1/notificaciones';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "centro_solicitud": center,
      "producto": idProduct,
      "cantidad": quantity,
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
