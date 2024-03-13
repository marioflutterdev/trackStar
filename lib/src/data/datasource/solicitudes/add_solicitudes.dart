import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

class AddSolicitudes extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<dynamic> addSolicitudes({
    final String? idSolicitudes,
    final String? center,
    final String? idProduct,
    final int? quantity,
    final String? nombreCenterPertenece,
  }) async {
    loading = true;

    const String url = '/rest/v1/solicitud';

    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "id": idSolicitudes,
      "centro": center,
      "producto": idProduct,
      "cantidad": quantity,
      "nombre_centro": nombreCenterPertenece
    };

    final res = await dio.post(url, data: data);
    print(res.statusCode);
    print(res.data);

    if (res.statusCode == 201) {
      loading = false;
      return true;
    } else {
      loading = false;
      return false;
    }
  }
}
