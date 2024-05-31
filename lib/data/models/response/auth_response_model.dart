import 'dart:convert';

class AuthResponseModel {
  String? token;
  User? user;

  AuthResponseModel({
    this.token,
    this.user,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        token: json["token"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user": user?.toMap(),
      };

  void updateUser(User updatedUser) {
    user = updatedUser;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? role;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserDetail? userDetail;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.userDetail,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userDetail: json["user_detail"] == null
            ? null
            : UserDetail.fromMap(json["user_detail"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_detail": userDetail?.toMap(),
      };
}

class UserDetail {
  int? id;
  String? jenisKelamin;
  String? alamat;
  String? noTelp;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDetail({
    this.id,
    this.jenisKelamin,
    this.alamat,
    this.noTelp,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetail.fromJson(String str) =>
      UserDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetail.fromMap(Map<String, dynamic> json) => UserDetail(
        id: json["id"],
        jenisKelamin: json["jenis_kelamin"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "jenis_kelamin": jenisKelamin,
        "alamat": alamat,
        "no_telp": noTelp,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
