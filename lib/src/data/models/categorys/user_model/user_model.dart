import 'dart:convert';

List<UsersGetModel> usersFromJson(String str) => List<UsersGetModel>.from(
    json.decode(str).map((x) => UsersGetModel.fromJson(x)));

String usersToJson(List<UsersGetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersGetModel {
  final String id;
  final String? fullName;
  final String email;
  final bool superUser;
  final String? descriptionUser;
  final dynamic avatarUrl;

  UsersGetModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.superUser,
    required this.descriptionUser,
    required this.avatarUrl,
  });

  factory UsersGetModel.fromJson(Map<String, dynamic> json) => UsersGetModel(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        superUser: json["super_user"],
        descriptionUser: json["description_user"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "super_user": superUser,
        "description_user": descriptionUser,
        "avatar_url": avatarUrl,
      };

  UsersGetModel toUserGetEntity() => UsersGetModel(
        id: id,
        fullName: fullName,
        email: email,
        superUser: superUser,
        descriptionUser: descriptionUser,
        avatarUrl: avatarUrl,
      );
}
