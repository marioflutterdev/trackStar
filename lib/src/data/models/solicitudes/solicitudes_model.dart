// To parse this JSON data, do
//
//     final notificacionesSolicitudesModel = notificacionesSolicitudesModelFromJson(jsonString);

import 'package:trackstar_web/src/data/data.dart';

class SolicitudesModel {
  final String id;
  final String? nameCenter;
  final int cantidad;
  final CenterModel centro;
  final ProductsModel producto;

  SolicitudesModel({
    required this.id,
    required this.cantidad,
    required this.centro,
    required this.producto,
    this.nameCenter,
  });

  factory SolicitudesModel.fromJson(Map<String, dynamic> json) =>
      SolicitudesModel(
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
