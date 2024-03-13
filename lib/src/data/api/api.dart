import 'package:dio/dio.dart';

import 'package:trackstar_web/src/config/constans/constans.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    validateStatus: (status) {
      return status! < 500;
    },
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
      'apikey': apikey,
      'Authorization': 'Bearer $apikey',
    },
  ),
);
