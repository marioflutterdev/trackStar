import 'package:flutter/material.dart';
import 'package:trackstar_web/src/config/constans/constans.dart';
import 'package:trackstar_web/src/data/api/api.dart';

class DeleteCart extends ChangeNotifier {
  final String accessToken = 'Bearer $apikey';

  Future<bool> delateCart(
    String id,
  ) async {
    final url = '/rest/v1/cart?id=eq.$id';

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.delete(url);

    if (res.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
