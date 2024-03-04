import 'package:flutter/material.dart';
import 'package:trackstar_web/src/config/constans/constans.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../api/api.dart';

class GetSolicitudes extends ChangeNotifier {
  bool _loading = true;
  final List<NotificaiconesSolicitudes> _solicitudes = [];

  final String accessToken = 'Bearer $apikey';
  bool get loading => _loading;

  List<NotificaiconesSolicitudes> get solicitudes => _solicitudes;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  GetSolicitudes() {
    getSolicitudes();
  }

  Future<void> getSolicitudes() async {
    const url = '/rest/v1/solicitudes?select=*,producto:producto(*)';
    loading = true;

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get(url);
    print(res.data);
    if (res.statusCode == 200) {
      res.data.forEach(
        (element) {
          _solicitudes.add(NotificaiconesSolicitudes.fromJson(element));
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
