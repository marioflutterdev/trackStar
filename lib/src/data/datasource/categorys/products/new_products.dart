import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';

class NewProduct extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  final String accessToken = 'Bearer $apikey';

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> createNewProduct(
    String name,
    String description,
    String? path,
  ) async {
    loading = true;
    print('path:    $path');

    const String url = '/rest/v1/products';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "name_product": name,
      "description_product": description,
    };

    final res = await dio.post(url, data: data);

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
