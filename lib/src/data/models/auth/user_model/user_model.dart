// To parse this JSON data, do
//
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String accessToken;
  final String tokenType;
  final UserClass user;

  User({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user.toJson(),
      };
}

class UserClass {
  final UserMetadata userMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserClass({
    required this.userMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        userMetadata: UserMetadata.fromJson(json["user_metadata"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_metadata": userMetadata.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class UserMetadata {
  final String addressProfile;
  final String avatarUrl;
  final String center;
  final String documentProfile;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final bool superUser;

  UserMetadata({
    required this.addressProfile,
    required this.avatarUrl,
    required this.center,
    required this.documentProfile,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.superUser,
  });

  factory UserMetadata.fromJson(Map<String, dynamic> json) => UserMetadata(
        addressProfile: json["address_profile"],
        avatarUrl: json["avatar_url"],
        center: json["center"],
        documentProfile: json["document_profile"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        superUser: json["super_user"],
      );

  Map<String, dynamic> toJson() => {
        "address_profile": addressProfile,
        "avatar_url": avatarUrl,
        "center": center,
        "document_profile": documentProfile,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "super_user": superUser,
      };
}
