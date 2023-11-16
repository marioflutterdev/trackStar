import 'package:flutter/material.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';
import '../../../data.dart';

class DelateProduct extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  final String accessToken = 'Bearer $apikey';

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> delateProduct(
    String id,
  ) async {
    loading = true;

    final url =
        'https://ztqeizrfbddnmuvjznav.supabase.co/rest/v1/products?id=eq.$id';

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.delete(url);

    if (res.statusCode == 201) {
      loading = false;
      GetProducts().getProducts();
      return true;
    } else {
      loading = false;
      return false;
    }
  }
}
