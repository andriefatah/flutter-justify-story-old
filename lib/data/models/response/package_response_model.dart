import 'dart:convert';

class PackageResponseModel {
  final int? id;
  final String? nama;
  final String? gambar;
  final String? deskripsi;
  final String? harga;
  final String? diskon;
  final String? hargaAkhir;
  final String? categoryName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PackageResponseModel({
    this.id,
    this.nama,
    this.gambar,
    this.deskripsi,
    this.harga,
    this.diskon,
    this.hargaAkhir,
    this.categoryName,
    this.createdAt,
    this.updatedAt,
  });

  PackageResponseModel copyWith({
    int? id,
    String? nama,
    String? gambar,
    String? deskripsi,
    String? harga,
    String? diskon,
    String? hargaAkhir,
    String? categoryName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PackageResponseModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      gambar: gambar ?? this.gambar,
      deskripsi: deskripsi ?? this.deskripsi,
      harga: harga ?? this.harga,
      diskon: diskon ?? this.diskon,
      hargaAkhir: hargaAkhir ?? this.hargaAkhir,
      categoryName: categoryName ?? this.categoryName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory PackageResponseModel.fromJson(String str) =>
      PackageResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PackageResponseModel.fromMap(Map<String, dynamic> json) =>
      PackageResponseModel(
        id: json["id"],
        nama: json["nama"],
        gambar: json["gambar"],
        deskripsi: json["deskripsi"],
        harga: json["harga"],
        diskon: json["diskon"],
        hargaAkhir: json["harga_akhir"],
        categoryName: json["category_name"],
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
        "deskripsi": deskripsi,
        "harga": harga,
        "diskon": diskon,
        "harga_akhir": hargaAkhir,
        "category_name": categoryName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
