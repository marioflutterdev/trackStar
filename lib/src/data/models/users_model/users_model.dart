import 'dart:convert';

List<UsersGetModel> usersGetModelFromJson(String str) =>
    List<UsersGetModel>.from(
        json.decode(str).map((x) => UsersGetModel.fromJson(x)));

String usersGetModelToJson(List<UsersGetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersGetModel {
  final String id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? addressProfile;
  final String? documentProfile;
  final String? avatarUrl;
  final String? phoneNumber;
  final bool? superUser;
  final String? center;

  UsersGetModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.addressProfile,
    this.documentProfile,
    required this.avatarUrl,
    this.phoneNumber,
    required this.superUser,
    this.center,
  });

  factory UsersGetModel.fromJson(Map<String, dynamic> json) => UsersGetModel(
        id: json["id"],
        email: json["email"] as String?, // Asegúrate de que acepte null
        firstName: json["first_name"] as String?,
        lastName: json["last_name"] as String?,
        addressProfile: json["address_profile"] as String?,
        documentProfile: json["document_profile"] as String?,
        avatarUrl: json["avatar_url"] as String?,
        phoneNumber: json["phone_number"] as String?,
        superUser: json["super_user"] as bool?,
        center: json["center"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "address_profile": addressProfile,
        "document_profile": documentProfile,
        "avatar_url": avatarUrl,
        "phone_number": phoneNumber,
        "super_user": superUser,
        "center": center,
      };
}
