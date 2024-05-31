import 'dart:convert';

class GalleryResponseModel {
  final int? id;
  final String? judul;
  final String? deskripsi;
  final String? thumbnail;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Media>? media;

  GalleryResponseModel({
    this.id,
    this.judul,
    this.deskripsi,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
    this.media,
  });

  factory GalleryResponseModel.fromJson(String str) =>
      GalleryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GalleryResponseModel.fromMap(Map<String, dynamic> json) =>
      GalleryResponseModel(
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        thumbnail: json["thumbnail"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "thumbnail": thumbnail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}

class Media {
  final int? id;
  final int? galleryId;
  final String? path;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Media({
    this.id,
    this.galleryId,
    this.path,
    this.createdAt,
    this.updatedAt,
  });

  factory Media.fromJson(String str) => Media.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        id: json["id"],
        galleryId: json["gallery_id"],
        path: json["path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "gallery_id": galleryId,
        "path": path,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
