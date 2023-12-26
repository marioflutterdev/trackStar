import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

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

  Future<bool> editCenter({required final CenterModel center}) async {
    loading = true;
    final url =
        'https://ztqeizrfbddnmuvjznav.supabase.co/rest/v1/center?id=eq.${center.id}';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "name_center": center.nameCenter,
      "address_center": center.addressCenter,
      "description_center": center.descriptionCenter,
    };

    final res = await dio.patch(url, data: data);

    print(res.statusCode);
    if (res.statusCode == 204) {
      loading = false;
      return true;
    } else {
      loading = false;
      return false;
    }
  }
}
