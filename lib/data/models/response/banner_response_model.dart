import 'dart:convert';

class BannerResponseModel {
  final int? id;
  final String? nama;
  final String? gambar;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BannerResponseModel({
    this.id,
    this.nama,
    this.gambar,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerResponseModel.fromJson(String str) =>
      BannerResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerResponseModel.fromMap(Map<String, dynamic> json) =>
      BannerResponseModel(
        id: json["id"],
        nama: json["nama"],
        gambar: json["gambar"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "gambar": gambar,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
