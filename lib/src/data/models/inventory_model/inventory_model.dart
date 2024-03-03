import '../../../data.dart';

class InventoryModel {
  final String id;
  final int quantity;
  final int price;
  final String center;
  final ProductsModel product;

  InventoryModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.product,
    required this.center,
  });

  factory InventoryModel.fromJson(Map<String, dynamic> json) => InventoryModel(
        id: json["id"],
        quantity: json["quantity"],
        price: json["price"],
        center: json["id_center"],
        product: ProductsModel.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "price": price,
        "id_center": center,
        "product": product.toJson(),
      };
}
