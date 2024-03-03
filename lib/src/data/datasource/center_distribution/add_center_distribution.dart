import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trackstar_web/src/data/datasource/upload/upload_imagen.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';

class NewCenter extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  final String accessToken = 'Bearer $apikey';

  String _url = '';

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<bool> createNewCenter({
    final String? name,
    final String? address,
    final String? description,
    final XFile? avatarUrl,
  }) async {
    loading = true;

    if (avatarUrl != null) {
      final res = await addImage(avatarUrl);
      _url = res;
    }

    const String url = '/rest/v1/center';

    dio.options.headers['Authorization'] = ' $accessToken';
    dio.options.headers['Prefer'] = 'return=minimal';

    final data = {
      "name_center": name,
      "address_center": address,
      "description_center": description,
      "avatar_url": _url
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
