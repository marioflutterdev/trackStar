// To parse this JSON data, do
//
//     final notificacionesSolicitudesModel = notificacionesSolicitudesModelFromJson(jsonString);

import 'dart:convert';

import 'package:trackstar_web/src/data/data.dart';

List<NotificacionesModel> notificacionesSolicitudesModelFromJson(String str) =>
    List<NotificacionesModel>.from(
        json.decode(str).map((x) => NotificacionesModel.fromJson(x)));

String notificacionesSolicitudesModelToJson(List<NotificacionesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificacionesModel {
  final String id;
  final String? nameCenter;
  final int cantidad;
  final CenterModel centro;
  final ProductsModel producto;

  NotificacionesModel({
    required this.id,
    required this.cantidad,
    required this.centro,
    required this.producto,
    this.nameCenter,
  });

  factory NotificacionesModel.fromJson(Map<String, dynamic> json) =>
      NotificacionesModel(
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
