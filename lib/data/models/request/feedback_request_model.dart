import 'dart:convert';

class FeedbackRequestModel {
  final String? judul;
  final String? pesan;
  final int? userId;

  FeedbackRequestModel({
    this.judul,
    this.pesan,
    this.userId,
  });

  factory FeedbackRequestModel.fromJson(String str) =>
      FeedbackRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeedbackRequestModel.fromMap(Map<String, dynamic> json) =>
      FeedbackRequestModel(
        judul: json["judul"],
        pesan: json["pesan"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "judul": judul,
        "pesan": pesan,
        "user_id": userId,
      };
}
