import 'dart:convert';

class DetailBookingResponseModel {
  final Booking? booking;

  DetailBookingResponseModel({
    this.booking,
  });

  factory DetailBookingResponseModel.fromJson(String str) =>
      DetailBookingResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailBookingResponseModel.fromMap(Map<String, dynamic> json) =>
      DetailBookingResponseModel(
        booking:
            json["booking"] == null ? null : Booking.fromMap(json["booking"]),
      );

  Map<String, dynamic> toMap() => {
        "booking": booking?.toMap(),
      };
}

class Booking {
  final int? id;
  final int? userId;
  final DateTime? tanggalJamFoto;
  final String? atasNamaPemesanan;
  final String? lokasiAcara;
  final String? noHpPemesan;
  final String? catatan;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Transaction? transaction;
  final Package? package;
  final List<PaymentProof>? paymentProofs;

  Booking({
    this.id,
    this.userId,
    this.tanggalJamFoto,
    this.atasNamaPemesanan,
    this.lokasiAcara,
    this.noHpPemesan,
    this.catatan,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.transaction,
    this.package,
    this.paymentProofs,
  });

  factory Booking.fromJson(String str) => Booking.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Booking.fromMap(Map<String, dynamic> json) => Booking(
        id: json["id"],
        userId: json["user_id"],
        tanggalJamFoto: json["tanggal_jam_foto"] == null
            ? null
            : DateTime.parse(json["tanggal_jam_foto"]),
        atasNamaPemesanan: json["atas_nama_pemesanan"],
        lokasiAcara: json["lokasi_acara"],
        noHpPemesan: json["no_hp_pemesan"],
        catatan: json["catatan"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        transaction: json["transaction"] == null
            ? null
            : Transaction.fromMap(json["transaction"]),
        package:
            json["package"] == null ? null : Package.fromMap(json["package"]),
        paymentProofs: json["payment_proofs"] == null
            ? []
            : List<PaymentProof>.from(
                json["payment_proofs"]!.map((x) => PaymentProof.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "tanggal_jam_foto": tanggalJamFoto?.toIso8601String(),
        "atas_nama_pemesanan": atasNamaPemesanan,
        "lokasi_acara": lokasiAcara,
        "no_hp_pemesan": noHpPemesan,
        "catatan": catatan,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "transaction": transaction?.toMap(),
        "package": package?.toMap(),
        "payment_proofs": paymentProofs == null
            ? []
            : List<dynamic>.from(paymentProofs!.map((x) => x.toMap())),
      };
}

class Package {
  final int? id;
  final String? nama;
  final String? gambar;
  final String? harga;
  final int? isActive;
  final Category? category;

  Package({
    this.id,
    this.nama,
    this.gambar,
    this.harga,
    this.isActive,
    this.category,
  });

  factory Package.fromJson(String str) => Package.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Package.fromMap(Map<String, dynamic> json) => Package(
        id: json["id"],
        nama: json["nama"],
        gambar: json["gambar"],
        harga: json["harga"],
        isActive: json["is_active"],
        category: json["category"] == null
            ? null
            : Category.fromMap(json["category"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "gambar": gambar,
        "harga": harga,
        "is_active": isActive,
        "category": category?.toMap(),
      };
}

class Category {
  final int? id;
  final String? nama;

  Category({
    this.id,
    this.nama,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
      };
}

class PaymentProof {
  final int? id;
  final int? userId;
  final int? transactionId;
  final String? fileBukti;
  final String? nominal;
  final String? status;
  final String? catatan;
  final String? metodePembayaran;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentProof({
    this.id,
    this.userId,
    this.transactionId,
    this.fileBukti,
    this.nominal,
    this.status,
    this.catatan,
    this.metodePembayaran,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentProof.fromJson(String str) =>
      PaymentProof.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentProof.fromMap(Map<String, dynamic> json) => PaymentProof(
        id: json["id"],
        userId: json["user_id"],
        transactionId: json["transaction_id"],
        fileBukti: json["file_bukti"],
        nominal: json["nominal"],
        status: json["status"],
        catatan: json["catatan"],
        metodePembayaran: json["metode_pembayaran"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "transaction_id": transactionId,
        "file_bukti": fileBukti,
        "nominal": nominal,
        "status": status,
        "catatan": catatan,
        "metode_pembayaran": metodePembayaran,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Transaction {
  final int? id;
  final String? jumlahTotal;
  final String? jumlahDibayar;
  final String? sisaPiutang;
  final String? statusPembayaran;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Transaction({
    this.id,
    this.jumlahTotal,
    this.jumlahDibayar,
    this.sisaPiutang,
    this.statusPembayaran,
    this.createdAt,
    this.updatedAt,
  });

  factory Transaction.fromJson(String str) =>
      Transaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        jumlahTotal: json["jumlah_total"],
        jumlahDibayar: json["jumlah_dibayar"],
        sisaPiutang: json["sisa_piutang"],
        statusPembayaran: json["status_pembayaran"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "jumlah_total": jumlahTotal,
        "jumlah_dibayar": jumlahDibayar,
        "sisa_piutang": sisaPiutang,
        "status_pembayaran": statusPembayaran,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
