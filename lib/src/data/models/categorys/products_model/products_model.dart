import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  final String id;
  final String nameProduct;
  final String descriptionProduct;
  final String? avatarUrl;

  ProductsModel({
    required this.id,
    required this.nameProduct,
    required this.descriptionProduct,
    required this.avatarUrl,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        nameProduct: json["name_product"],
        descriptionProduct: json["description_product"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_product": nameProduct,
        "description_product": descriptionProduct,
        "avatar_url": avatarUrl,
      };
}
