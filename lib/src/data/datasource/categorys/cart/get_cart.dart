import 'package:flutter/material.dart';
import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';
import '../../../data.dart';

class GetCartProducts extends ChangeNotifier {
  bool _loading = true;
  final List<CartModel> _cartProducts = [];
  // Todo solo trer los datos del carrito de el centro en le que estoy
  final url = '/rest/v1/cart?select=*,product:product(*)';

  final String accessToken = 'Bearer $apikey';
  bool get loading => _loading;

  List<CartModel> get cartProducts => _cartProducts;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  GetCartProducts() {
    getCart();
  }
  Future<void> getCart() async {
    loading = true;

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
