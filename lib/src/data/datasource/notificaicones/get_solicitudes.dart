import 'package:flutter/material.dart';
import 'package:trackstar_web/src/config/constans/constans.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../api/api.dart';

class GetSolicitudes extends ChangeNotifier {
  bool _loading = true;
  final List<NotificacionesSolicitudesModel> _solicitudes = [];

  final String accessToken = 'Bearer $apikey';
  bool get loading => _loading;

  List<NotificacionesSolicitudesModel> get solicitudes => _solicitudes;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<void> getSolicitudes(
    User user,
  ) async {
    final url =
        '/rest/v1/solicitud?centro=eq.${user.user.userMetadata.center}&select=id,nombre_centro,centro:centro(*),producto:producto(*),cantidad';
    loading = true;

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get(url);
    print('res.data: ${res.data}');
    print('res.statusCode: ${res.statusCode}');

    if (res.statusCode == 200) {
      res.data.forEach(
        (element) {
          _solicitudes.add(NotificacionesSolicitudesModel.fromJson(element));
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
