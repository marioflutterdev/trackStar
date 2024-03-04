import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';

class NewCartItem extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  get accessToken => null;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> createNewProduct({
    final String? center,
    final String? centerPertenece,
    final String? nameProduct,
    final String? quantity,
  }) async {
    loading = true;

    const String url = '/rest/v1/cart';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "center": center,
      "center_pertenece": centerPertenece,
      "product": nameProduct,
      "quantity": quantity,
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
