// To parse this JSON data, do
//
//     final notificacionesSolicitudesModel = notificacionesSolicitudesModelFromJson(jsonString);

import 'dart:convert';

import 'package:trackstar_web/src/data/data.dart';

List<NotificacionesSolicitudesModel> notificacionesSolicitudesModelFromJson(
        String str) =>
    List<NotificacionesSolicitudesModel>.from(json
        .decode(str)
        .map((x) => NotificacionesSolicitudesModel.fromJson(x)));

String notificacionesSolicitudesModelToJson(
        List<NotificacionesSolicitudesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificacionesSolicitudesModel {
  final int id;
  final String? nameCenter;
  final int cantidad;
  final CenterModel centro;
  final ProductsModel producto;

  NotificacionesSolicitudesModel({
    required this.id,
    required this.cantidad,
    required this.centro,
    required this.producto,
    this.nameCenter,
  });

  factory NotificacionesSolicitudesModel.fromJson(Map<String, dynamic> json) =>
      NotificacionesSolicitudesModel(
        id: json["id"],
        nameCenter: json["nombre_centro"],
        cantidad: json["cantidad"],
        centro: CenterModel.fromJson(json["centro"]),
        producto: ProductsModel.fromJson(json["producto"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_centro": nameCenter,
        "cantidad": cantidad,
        "centro": centro.toJson(),
        "producto": producto.toJson(),
      };
}
