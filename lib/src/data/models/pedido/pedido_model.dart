import 'package:trackstar_web/src/data/data.dart';

class PedidoModel {
  final int cantidad;
  final ProductsModel producto;
  final DateTime createdAt;
  final IdItem? idSolicitud;
  final IdItem? idNotificacion;

  PedidoModel({
    required this.cantidad,
    required this.producto,
    required this.createdAt,
    this.idSolicitud,
    this.idNotificacion,
  });

  factory PedidoModel.fromJson(Map<String, dynamic> json) => PedidoModel(
        cantidad: json["cantidad"],
        producto: ProductsModel.fromJson(json["producto"]),
        createdAt: DateTime.parse(json["created_at"]),
        idSolicitud: IdItem.fromJson(json["id_solicitud"]),
        idNotificacion: IdItem.fromJson(json["id_notificacion"]),
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "producto": producto.toJson(),
        "created_at": createdAt.toIso8601String(),
        "id_solicitud": idSolicitud?.toJson(),
        "id_notificacion": idNotificacion?.toJson(),
      };
}

class IdItem {
  final CenterModel centro;

  IdItem({
    required this.centro,
  });

  factory IdItem.fromJson(Map<String, dynamic> json) => IdItem(
        centro: CenterModel.fromJson(json["centro"]),
      );

  Map<String, dynamic> toJson() => {
        "centro": centro.toJson(),
      };
}
