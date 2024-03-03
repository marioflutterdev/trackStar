import 'package:flutter/material.dart';

import '../../../config/constans/constans.dart';
import '../../api/api.dart';

class DeleteCenter extends ChangeNotifier {
  final String accessToken = 'Bearer $apikey';

  Future<bool> delateCenter(
    String id,
  ) async {
    final url = '/rest/v1/center?id=eq.$id';

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.delete(url);

    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
