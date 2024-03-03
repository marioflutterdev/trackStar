import 'package:flutter/material.dart';

import '../../../config/constans/constans.dart';
import '../../api/api.dart';
import '../../data.dart';

class GetCartProducts extends ChangeNotifier {
  bool _loading = true;
  final List<CartModel> _cartProducts = [];

  final String accessToken = 'Bearer $apikey';
  bool get loading => _loading;

  List<CartModel> get cartProducts => _cartProducts;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<void> getCart(User user) async {
    final url =
        '/rest/v1/cart?center=eq.${user.user.userMetadata.center}&select=*,product:product(*)';
    loading = true;

    print('url $url');

    _cartProducts.clear();

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get(url);
    if (res.statusCode == 200) {
      res.data.forEach(
        (element) {
          _cartProducts.add(CartModel.fromJson(element));
        },
      );

      Future.delayed(
        const Duration(
          seconds: 2,
        ),
        () => loading = false,
      );

      notifyListeners();
    } else {
      loading = false;
    }
  }
}
