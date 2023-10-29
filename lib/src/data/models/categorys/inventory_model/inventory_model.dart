import 'dart:convert';

List<InventoryModel> inventoryModelFromJson(String str) =>
    List<InventoryModel>.from(
        json.decode(str).map((x) => InventoryModel.fromJson(x)));

String inventoryModelToJson(List<InventoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryModel {
  final String id;
  final String idCenter;
  final String nameProduct;
  final String img;
  final int quantity;
  final int price;

  InventoryModel({
    required this.id,
    required this.idCenter,
    required this.nameProduct,
    required this.img,
    required this.quantity,
    required this.price,
  });

  factory InventoryModel.fromJson(Map<String, dynamic> json) => InventoryModel(
        id: json["id"],
        idCenter: json["id_center"],
        nameProduct: json["name_product"],
        img: json["avatar_product"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_center": idCenter,
        "name_product": nameProduct,
        "avatar_product": img,
        "quantity": quantity,
        "price": price,
      };
}
