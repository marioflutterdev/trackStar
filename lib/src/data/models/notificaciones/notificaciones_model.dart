// To parse this JSON data, do
//
//     final notificacionModel = notificacionModelFromJson(jsonString);

import 'dart:convert';

import 'package:trackstar_web/src/data/models/pedido/pedido_model.dart';

List<NotificacionesSolicitudesModel> notificacionModelFromJson(String str) =>
    List<NotificacionesSolicitudesModel>.from(json
        .decode(str)
        .map((x) => NotificacionesSolicitudesModel.fromJson(x)));

String notificacionModelToJson(List<NotificacionesSolicitudesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificacionesSolicitudesModel {
  final String centro;
  final PedidoModel pedido;

  NotificacionesSolicitudesModel({
    required this.centro,
    required this.pedido,
  });

  factory NotificacionesSolicitudesModel.fromJson(Map<String, dynamic> json) =>
      NotificacionesSolicitudesModel(
        centro: json["centro"],
        pedido: PedidoModel.fromJson(json["id_pedido"]),
      );

  Map<String, dynamic> toJson() => {
        "centro": centro,
        "id_pedido": pedido.toJson(),
      };
}
