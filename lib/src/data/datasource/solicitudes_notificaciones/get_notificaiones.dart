import 'package:flutter/material.dart';
import 'package:trackstar_web/src/config/constans/constans.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../api/api.dart';

class GetNotificaciones extends ChangeNotifier {
  bool _loading = true;
  final List<NotificacionesSolicitudesModel> _notificaciones = [];

  final String accessToken = 'Bearer $apikey';
  bool get loading => _loading;

  List<NotificacionesSolicitudesModel> get notificaciones => _notificaciones;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<void> getSolicitudes() async {
    const url =
        'rest/v1/notificacion?id.eq.78b5a4d7-f16c-440a-9c9e-45ba56afe026&select=centro,id_pedido:id_pedido(cantidad,created_at,producto:producto(*),id_solicitud:id_solicitud(centro:centro(*)))';
    loading = true;

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get(url);

    if (res.statusCode == 200) {
      res.data.forEach(
        (element) {
          _notificaciones.add(NotificacionesSolicitudesModel.fromJson(element));
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
