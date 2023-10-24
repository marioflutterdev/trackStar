import 'dart:convert';

List<UsersGet> usersFromJson(String str) =>
    List<UsersGet>.from(json.decode(str).map((x) => UsersGet.fromJson(x)));

String usersToJson(List<UsersGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersGet {
  final String id;
  final String? fullName;
  final String email;
  final bool superUser;
  final String? descriptionUser;
  final dynamic avatarUrl;

  UsersGet({
    required this.id,
    required this.fullName,
    required this.email,
    required this.superUser,
    required this.descriptionUser,
    required this.avatarUrl,
  });

  factory UsersGet.fromJson(Map<String, dynamic> json) => UsersGet(
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
}
