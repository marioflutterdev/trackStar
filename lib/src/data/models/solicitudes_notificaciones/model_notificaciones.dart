import '../../data.dart';

class NotificaiconesSolicitudes {
  final String id;
  final String createdAt;
  final int cantidad;
  final ProductsModel producto;
  final String centroSolicitud;

  NotificaiconesSolicitudes({
    required this.id,
    required this.createdAt,
    required this.cantidad,
    required this.producto,
    required this.centroSolicitud,
  });

  factory NotificaiconesSolicitudes.fromJson(Map<String, dynamic> json) =>
      NotificaiconesSolicitudes(
        id: json["id"],
        createdAt: json["created_at"],
        cantidad: json["cantidad"],
        producto: ProductsModel.fromJson(json["proqducto"]),
        centroSolicitud: json["centro_solicitud"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "cantidad": cantidad,
        "producto": producto.toJson(),
        "centro_solicitud": centroSolicitud,
      };
}
