import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

class AddNotificaciones extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<dynamic> addNotificaciones({
    final String? idNotificaciones,
    final String? center,
    final String? idProduct,
    final int? quantity,
    final String? centroNotificado,
  }) async {
    loading = true;

    const String url = '/rest/v1/notificacion';

    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "id": idNotificaciones,
      "centro": center,
      "producto": idProduct,
      "cantidad": quantity,
      "nombre_centro": centroNotificado
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
