import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/api/api.dart';
import 'package:uuid/uuid.dart';

class AddPedido extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  late String _uuidSolicitudes;
  late String _uuidNotificaciones;
  String get uuidSolicitudes => _uuidSolicitudes;
  String get uuidNotificaciones => _uuidNotificaciones;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<dynamic> addPedidos() async {
    loading = true;

    _uuidSolicitudes = const Uuid().v4();
    _uuidNotificaciones = const Uuid().v4();

    const String url = '/rest/v1/pedido';

    final data = {
      "id_solicitud": _uuidSolicitudes,
      "id_notificacion": _uuidNotificaciones
    };
    final res = await dio.post(url, data: data);
    if (res.statusCode == 201) {
      loading = false;
      return true;
    } else {
      print(res.statusCode);
      print(res.data);
      loading = false;
      return false;
    }
  }
}
