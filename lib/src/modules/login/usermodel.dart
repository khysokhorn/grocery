import 'dart:convert';

import 'package:hive/hive.dart';

part 'usermodel.g.dart';

UserModel userModelFromJson(String? str) =>
    UserModel.fromJson(json.decode(str!));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  UserModel({
    required this.user,
    required this.token,
  });

  @HiveField(0)
  User? user;
  @HiveField(1)
  String? token;

  factory UserModel.fromJson(Map<String, dynamic>? json) => UserModel(
        user: User.fromJson(json!["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "token": token,
      };
}

@HiveType(typeId: 1)
class User {
  User({
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  DateTime updatedAt;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  int id;

  factory User.fromJson(Map<String, dynamic>? json) => User(
        name: json!["name"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
