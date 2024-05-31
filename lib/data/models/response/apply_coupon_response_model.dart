import 'dart:convert';

class ApplyCouponResponseModel {
  final String? message;
  final int? totalPembayaranBaru;

  ApplyCouponResponseModel({
    this.message,
    this.totalPembayaranBaru,
  });

  factory ApplyCouponResponseModel.fromJson(String str) =>
      ApplyCouponResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApplyCouponResponseModel.fromMap(Map<String, dynamic> json) =>
      ApplyCouponResponseModel(
        message: json["message"],
        totalPembayaranBaru: json["total_pembayaran_baru"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "total_pembayaran_baru": totalPembayaranBaru,
      };
}
