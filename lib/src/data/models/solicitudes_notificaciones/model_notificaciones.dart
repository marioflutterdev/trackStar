import '../../data.dart';

class NotificaiconesSolicitudes {
  final String id;
  final String? createdAt;
  final int? cantidad;
  final ProductsModel? producto;
  final String? miCentro;
  final String? centroPeticion;

  NotificaiconesSolicitudes({
    required this.id,
    this.createdAt,
    this.cantidad,
    this.producto,
    this.miCentro,
    this.centroPeticion,
  });

  factory NotificaiconesSolicitudes.fromJson(Map<String, dynamic> json) =>
      NotificaiconesSolicitudes(
        id: json["id"],
        createdAt: json["created_at"],
        cantidad: json["cantidad"],
        producto: ProductsModel.fromJson(json["producto"]),
        miCentro: json["mi_centro"],
        centroPeticion: json["centro_peticion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "cantidad": cantidad,
        "producto": producto?.toJson(),
        "centro_solicitud": miCentro,
        "centro_peticion": centroPeticion,
      };
}
