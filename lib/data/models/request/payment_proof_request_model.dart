import 'dart:convert';
import 'dart:io';

class PaymentProofRequestModel {
  final int userId;
  final int transactionId;
  final File fileBukti;
  final double nominal;
  final String metodePembayaran;
  final String? catatan;

  PaymentProofRequestModel({
    required this.userId,
    required this.transactionId,
    required this.fileBukti,
    required this.nominal,
    required this.metodePembayaran,
    this.catatan,
  });

  PaymentProofRequestModel copyWith({
    int? userId,
    int? transactionId,
    File? fileBukti,
    double? nominal,
    String? metodePembayaran,
    String? catatan,
  }) {
    return PaymentProofRequestModel(
      userId: userId ?? this.userId,
      transactionId: transactionId ?? this.transactionId,
      fileBukti: fileBukti ?? this.fileBukti,
      nominal: nominal ?? this.nominal,
      metodePembayaran: metodePembayaran ?? this.metodePembayaran,
      catatan: catatan ?? this.catatan,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'transaction_id': transactionId,
      'file_bukti': fileBukti.path,
      'nominal': nominal,
      'metode_pembayaran': metodePembayaran,
      'catatan': catatan,
    };
  }

  factory PaymentProofRequestModel.fromMap(Map<String, dynamic> map) {
    return PaymentProofRequestModel(
      userId: map['user_id']?.toInt() ?? 0,
      transactionId: map['transaction_id']?.toInt() ?? 0,
      fileBukti: File(map['file_bukti']),
      nominal: map['nominal']?.toDouble() ?? 0.0,
      metodePembayaran: map['metode_pembayaran'] ?? '',
      catatan: map['catatan'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentProofRequestModel.fromJson(String source) =>
      PaymentProofRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentProofRequestModel(userId: $userId, transactionId: $transactionId, fileBukti: ${fileBukti.path}, nominal: $nominal, metodePembayaran: $metodePembayaran, catatan: $catatan)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentProofRequestModel &&
        other.userId == userId &&
        other.transactionId == transactionId &&
        other.fileBukti.path == fileBukti.path &&
        other.nominal == nominal &&
        other.metodePembayaran == metodePembayaran &&
        other.catatan == catatan;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        transactionId.hashCode ^
        fileBukti.path.hashCode ^
        nominal.hashCode ^
        metodePembayaran.hashCode ^
        catatan.hashCode;
  }
}
