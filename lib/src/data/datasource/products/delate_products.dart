import 'package:flutter/material.dart';

import '../../../config/constans/constans.dart';
import '../../api/api.dart';

class DelateProduct extends ChangeNotifier {
  final String accessToken = 'Bearer $apikey';

  Future<bool> delateProduct(
    String id,
  ) async {
    final url = '/rest/v1/products?id=eq.$id';

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.delete(url);

    if (res.statusCode == 201) {
      print(res.data);
      return true;
    } else {
      print(res.data);
      return false;
    }
  }
}
