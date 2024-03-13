import 'package:flutter/material.dart';
import 'package:trackstar_web/src/config/constans/constans.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../api/api.dart';

class GetNotificaciones extends ChangeNotifier {
  bool _loading = true;
  final List<NotificacionesModel> _notificaciones = [];

  final String accessToken = 'Bearer $apikey';
  bool get loading => _loading;

  List<NotificacionesModel> get notificaciones => _notificaciones;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<void> getNotificaciones(User user) async {
    _notificaciones.clear();
    final url =
        '/rest/v1/notificacion?centro=eq.${user.user.userMetadata.center}&select=id,nombre_centro,centro:centro(*),producto:producto(*),cantidad';
    loading = true;

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get(url);

    if (res.statusCode == 200) {
      res.data.forEach(
        (element) {
          _notificaciones.add(NotificacionesModel.fromJson(element));
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
