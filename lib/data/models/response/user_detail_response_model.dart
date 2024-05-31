import 'dart:convert';

class UserDetailResponseModel {
  final int? id;
  final String? name;
  final String? email;
  final int? isActive;
  final UserDetail? userDetail;

  UserDetailResponseModel({
    this.id,
    this.name,
    this.email,
    this.isActive,
    this.userDetail,
  });

  factory UserDetailResponseModel.fromJson(String str) =>
      UserDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      UserDetailResponseModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        isActive: json["is_active"],
        userDetail: json["user_detail"] == null
            ? null
            : UserDetail.fromMap(json["user_detail"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "is_active": isActive,
        "user_detail": userDetail?.toMap(),
      };
}

class UserDetail {
  final int? id;
  final String? jenisKelamin;
  final String? alamat;
  final String? noTelp;
  final int? userId;

  UserDetail({
    this.id,
    this.jenisKelamin,
    this.alamat,
    this.noTelp,
    this.userId,
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
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "jenis_kelamin": jenisKelamin,
        "alamat": alamat,
        "no_telp": noTelp,
        "user_id": userId,
      };
}
