import 'dart:convert';

import '../../data.dart';

List<CenterModel> centerModelFromJson(String str) => List<CenterModel>.from(
    json.decode(str).map((x) => CenterModel.fromJson(x)));

String centerModelToJson(List<CenterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CenterModel {
  final String id;
  final String nameCenter;
  late final String addressCenter;
  final String descriptionCenter;
  final String? avatarUrl;
  final List<InventoryModel>? inventory;

  CenterModel({
    required this.id,
    required this.nameCenter,
    required this.addressCenter,
    required this.descriptionCenter,
    required this.avatarUrl,
    this.inventory,
  });

  factory CenterModel.fromJson(Map<String, dynamic> json) => CenterModel(
        id: json["id"],
        nameCenter: json["name_center"],
        addressCenter: json["address_center"],
        descriptionCenter: json["description_center"],
        avatarUrl: json["avatar_url"],
        inventory: json["inventory"] == null
            ? []
            : List<InventoryModel>.from(
                json["inventory"].map((x) => InventoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_center": nameCenter,
        "address_center": addressCenter,
        "description_center": descriptionCenter,
        "avatar_url": avatarUrl,
        "inventory": List<dynamic>.from(inventory!.map((x) => x.toJson())),
      };
}
