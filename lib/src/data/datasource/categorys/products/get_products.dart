import 'package:flutter/material.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';
import '../../../data.dart';

class GetProducts extends ChangeNotifier {
  bool _loading = true;
  final List<ProductsModel> _products = [];

  //TODO chage apikey for your apikey
  final String accessToken = 'Bearer $apikey';

  List<ProductsModel> get products => _products;

  bool get loading => _loading;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  GetProducts() {
    getProducts();
  }

  Future<void> getProducts() async {
    loading = true;

    _products.clear();

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get('/rest/v1/products?select=*');

    if (res.statusCode == 200) {
      res.data.forEach(
        (element) {
          _products.add(ProductsModel.fromJson(element));
        },
      );

      Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
        () => loading = false,
      );

      notifyListeners();
    } else {
      loading = false;
    }
  }
}
