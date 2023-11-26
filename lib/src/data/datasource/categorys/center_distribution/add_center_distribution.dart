import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

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

  Future<bool> createNewCenter(CenterModel center) async {
    loading = true;

    const String url = '/rest/v1/center';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    print(center);

    final data = {
      "name_center": center.nameCenter,
      "address_center": center.addressCenter,
      "description_center": center.descriptionCenter,
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
