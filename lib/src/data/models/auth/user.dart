class User {
  final String id;
  final String aud;
  final String role;
  final String email;
  final DateTime emailConfirmedAt;
  final String phone;
  final DateTime confirmationSentAt;
  final DateTime confirmedAt;
  final DateTime recoverySentAt;
  final DateTime lastSignInAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.aud,
    required this.role,
    required this.email,
    required this.emailConfirmedAt,
    required this.phone,
    required this.confirmationSentAt,
    required this.confirmedAt,
    required this.recoverySentAt,
    required this.lastSignInAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        aud: json["aud"],
        role: json["role"],
        email: json["email"],
        emailConfirmedAt: DateTime.parse(json["email_confirmed_at"]),
        phone: json["phone"],
        confirmationSentAt: DateTime.parse(json["confirmation_sent_at"]),
        confirmedAt: DateTime.parse(json["confirmed_at"]),
        recoverySentAt: DateTime.parse(json["recovery_sent_at"]),
        lastSignInAt: DateTime.parse(json["last_sign_in_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aud": aud,
        "role": role,
        "email": email,
        "email_confirmed_at": emailConfirmedAt.toIso8601String(),
        "phone": phone,
        "confirmation_sent_at": confirmationSentAt.toIso8601String(),
        "confirmed_at": confirmedAt.toIso8601String(),
        "recovery_sent_at": recoverySentAt.toIso8601String(),
        "last_sign_in_at": lastSignInAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
