import 'dart:convert';

class AboutMeResponseModel {
  final int? id;
  final String? deskripsi;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AboutMeResponseModel({
    this.id,
    this.deskripsi,
    this.createdAt,
    this.updatedAt,
  });

  factory AboutMeResponseModel.fromJson(String str) =>
      AboutMeResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AboutMeResponseModel.fromMap(Map<String, dynamic> json) =>
      AboutMeResponseModel(
        id: json["id"],
        deskripsi: json["deskripsi"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "deskripsi": deskripsi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
