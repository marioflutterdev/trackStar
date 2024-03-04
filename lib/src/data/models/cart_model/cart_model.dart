import 'dart:convert';

import '../../data.dart';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  final String id;
  final String center;
  final ProductsModel product;
  final String centerPertenece;
  final int quantity;

  CartModel({
    required this.id,
    required this.center,
    required this.product,
    required this.quantity,
    required this.centerPertenece,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        center: json["center"],
        product: ProductsModel.fromJson(json["product"]),
        quantity: json["quantity"],
        centerPertenece: json["center_pertenece"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "center": center,
        "product": product.toJson(),
        "quantity": quantity,
        "center_pertenece": centerPertenece,
      };
}
