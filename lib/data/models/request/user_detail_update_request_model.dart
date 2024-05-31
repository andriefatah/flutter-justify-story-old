import 'dart:convert';

class UserDetailUpdateRequestModel {
  final int? userId;
  final String? name;
  final String? email;
  final String? alamat;
  final String? noTelp;

  UserDetailUpdateRequestModel({
    this.userId,
    this.name,
    this.email,
    this.alamat,
    this.noTelp,
  });

  factory UserDetailUpdateRequestModel.fromJson(String str) =>
      UserDetailUpdateRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetailUpdateRequestModel.fromMap(Map<String, dynamic> json) =>
      UserDetailUpdateRequestModel(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "alamat": alamat,
        "no_telp": noTelp,
      };
}
