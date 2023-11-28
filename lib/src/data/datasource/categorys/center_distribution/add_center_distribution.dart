import 'package:flutter/material.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';

class NewCenter extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  final String accessToken = 'Bearer $apikey';

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> createNewCenter({
    final String? name,
    final String? address,
    final String? description,
  }) async {
    loading = true;

    const String url = '/rest/v1/center';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "name_center": name,
      "address_center": address,
      "description_center": description,
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
