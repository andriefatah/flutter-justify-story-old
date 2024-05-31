import 'dart:convert';

class CreateBookingRequestModel {
  final int? jumlahTotal;
  final int? jumlahDibayar;
  final int? sisaPiutang;
  final String? statusPembayaran;
  final int? packageId;
  final int? userId;
  final DateTime? tanggalJamFoto;
  final String? namaPemesan;
  final String? lokasi;
  final String? noHp;
  final String? catatan;
  final String? statusBooking;

  CreateBookingRequestModel({
    this.jumlahTotal,
    this.jumlahDibayar,
    this.sisaPiutang,
    this.statusPembayaran,
    this.packageId,
    this.userId,
    this.tanggalJamFoto,
    this.namaPemesan,
    this.lokasi,
    this.noHp,
    this.catatan,
    this.statusBooking,
  });

  factory CreateBookingRequestModel.fromJson(String str) =>
      CreateBookingRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateBookingRequestModel.fromMap(Map<String, dynamic> json) =>
      CreateBookingRequestModel(
        jumlahTotal: json["jumlah_total"],
        jumlahDibayar: json["jumlah_dibayar"],
        sisaPiutang: json["sisa_piutang"],
        statusPembayaran: json["status_pembayaran"],
        packageId: json["package_id"],
        userId: json["user_id"],
        tanggalJamFoto: json["tanggal_jam_foto"] == null
            ? null
            : DateTime.parse(json["tanggal_jam_foto"]),
        namaPemesan: json["nama_pemesan"],
        lokasi: json["lokasi"],
        noHp: json["no_hp"],
        catatan: json["catatan"],
        statusBooking: json["status_booking"],
      );

  Map<String, dynamic> toMap() => {
        "jumlah_total": jumlahTotal,
        "jumlah_dibayar": jumlahDibayar,
        "sisa_piutang": sisaPiutang,
        "status_pembayaran": statusPembayaran,
        "package_id": packageId,
        "user_id": userId,
        "tanggal_jam_foto": tanggalJamFoto?.toIso8601String(),
        "nama_pemesan": namaPemesan,
        "lokasi": lokasi,
        "no_hp": noHp,
        "catatan": catatan,
        "status_booking": statusBooking,
      };
}
