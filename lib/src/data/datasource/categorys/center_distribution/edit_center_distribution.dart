import 'package:flutter/material.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';

class EditCenter extends ChangeNotifier {
  bool _loading = false;

  final String accessToken = 'Bearer $apikey';

  bool get loading => _loading;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> editCenter({
    final String? id,
    final String? name,
    final String? addressCenter,
    final String? description,
  }) async {
    loading = true;

    final url =
        'https://ztqeizrfbddnmuvjznav.supabase.co/rest/v1/center?id=eq.$id';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "name_product": name,
      "address_product": addressCenter,
      "description_product": description,
    };

    final res = await dio.patch(url, data: data);

    if (res.statusCode == 201) {
      loading = false;
      return true;
    } else {
      loading = false;
      return false;
    }
  }
}
