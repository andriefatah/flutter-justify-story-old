import 'dart:convert';

class PaymentMethodResponseModel {
  final int? id;
  final String? nama;
  final String? nomor;
  final String? atasNama;
  final String? gambar;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentMethodResponseModel({
    this.id,
    this.nama,
    this.nomor,
    this.atasNama,
    this.gambar,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentMethodResponseModel.fromJson(String str) =>
      PaymentMethodResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentMethodResponseModel.fromMap(Map<String, dynamic> json) =>
      PaymentMethodResponseModel(
        id: json["id"],
        nama: json["nama"],
        nomor: json["nomor"],
        atasNama: json["atas_nama"],
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
        "nomor": nomor,
        "atas_nama": atasNama,
        "gambar": gambar,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
