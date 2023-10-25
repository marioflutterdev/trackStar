import 'package:flutter/material.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';
import '../../../data.dart';

class GetProducts extends ChangeNotifier {
  GetProducts() {
    getProducts();
  }

  bool _loading = true;
  final List<ProductsModel> _products = [];
  //TODO chage apikey for your apikey
  final String accessToken = 'Bearer $apikey';

  bool get loading => _loading;

  List<ProductsModel> get products => _products;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<void> getProducts() async {
    loading = true;
    _products.clear();

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get('/rest/v1/profiles?select=*');
    if (res.statusCode == 200) {
      res.data.forEach((element) {
        _products.add(ProductsModel.fromJson(element));
      });

      Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () => loading = false);

      notifyListeners();
    } else {
      loading = false;
    }
  }
}
