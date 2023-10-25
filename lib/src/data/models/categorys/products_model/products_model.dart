import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  final String id;
  final String nameProducts;
  final String descriptionProducts;
  final String avatarUrl;

  ProductsModel({
    required this.id,
    required this.nameProducts,
    required this.descriptionProducts,
    required this.avatarUrl,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        nameProducts: json["name_products"],
        descriptionProducts: json["description_products"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_products": nameProducts,
        "description_products": descriptionProducts,
        "avatar_url": avatarUrl,
      };
}
