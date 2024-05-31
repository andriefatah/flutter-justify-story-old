import 'package:flutter/material.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/extensions/int_ext.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/pages/payment_process_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/history_bookings_response_model.dart';

class DetailTransactionPage extends StatelessWidget {
  final HistoryTransaction transaction;

  const DetailTransactionPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: CustomAppBar(
        title: 'Detail Transaksi',
        backgroundColor: AppColors.appBarBackgroundColor,
        textColor: AppColors.appBarTextColor,
        iconColor: AppColors.appBarIconColor,
        statusBarBrightness: Brightness.dark,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBookingDetailsSection(),
              const SizedBox(height: 20),
              _buildAddressSection(),
              const SizedBox(height: 20),
              _buildNotesSection(),
              const SizedBox(height: 20),
              _buildTransactionDetailsSection(context),
              const SizedBox(height: 20),
              _buildPaymentProofSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookingDetailsSection() {
    return _buildDetailSection(
      title: 'Detail Booking',
      children: [
        _buildDetailRow('Nama Paket', transaction.package?.nama ?? 'N/A'),
        _buildDetailRow(
            'Kategori', transaction.package?.category?.nama ?? 'N/A'),
        _buildDetailRow(
            'Tanggal Foto',
            DateFormat('dd MMMM yyyy', 'id')
                .format(transaction.tanggalJamFoto ?? DateTime.now())),
        _buildDetailRow(
            'Jam Foto',
            DateFormat('HH:mm', 'id')
                .format(transaction.tanggalJamFoto ?? DateTime.now())),
        _buildStatusBadgeRow(
            'Status Booking', transaction.status ?? 'Status tidak ada'),
      ],
    );
  }

  Widget _buildAddressSection() {
    return _buildDetailSection(
      title: 'Alamat',
      children: [
        Text(transaction.lokasiAcara ?? 'Alamat tidak tersedia',
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('No HP',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w600)),
                  Text(transaction.noHpPemesan ?? 'No HP tidak tersedia',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Atas Nama',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w600)),
                  Text(transaction.atasNamaPemesanan ?? 'Nama tidak tersedia',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotesSection() {
    return _buildDetailSection(
      title: 'Catatan',
      children: [
        Center(
          child: Text(transaction.catatan ?? 'Tidak ada catatan',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }

  Widget _buildTransactionDetailsSection(BuildContext context) {
    return _buildDetailSection(
      title: 'Detail Transaksi',
      children: [
        _buildDetailRow('Jumlah Total',
            (transaction.transaction?.jumlahTotal ?? 0).currencyFormatRp),
        _buildDetailRow('Jumlah Dibayar',
            (transaction.transaction?.jumlahDibayar ?? 0).currencyFormatRp),
        _buildDetailRow('Sisa Piutang',
            (transaction.transaction?.sisaPiutang ?? 0).currencyFormatRp),
        _buildStatusBadgeRow('Status Pembayaran',
            transaction.transaction?.statusPembayaran ?? 'N/A'),
        const SizedBox(height: 20),
        if ((transaction.transaction?.sisaPiutang ?? 0) > 0 &&
            transaction.status != 'menunggu konfirmasi' &&
            transaction.status != 'ditolak')
          Button.filled(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentProcessPage(
                    transactionId: transaction.id ?? 0,
                    sisaPiutang: transaction.transaction?.sisaPiutang ?? 0.0,
                  ),
                ),
              );
            },
            label: 'Lakukan Pembayaran',
            height: 45.0,
            borderRadius: 20.0,
            fontSize: 14.0,
            color: Colors.black,
          ),
      ],
    );
  }

  Widget _buildPaymentProofSection() {
    return _buildDetailSection(
      title: 'Bukti Pembayaran',
      children: [
        if (transaction.transaction?.paymentProofs?.isEmpty ?? true)
          Center(
            child: Text(
              'Belum ada pembayaran yang dilakukan',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
            ),
          ),
        for (var paymentProof in transaction.transaction?.paymentProofs ?? [])
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Tanggal Bayar: ${DateFormat('dd MMMM yyyy', 'id').format(paymentProof.createdAt)}',
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w400)),
                Text('Metode Pembayaran: ${paymentProof.metodePembayaran}',
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w400)),
                _buildStatusBadge(paymentProof.status),
                const SizedBox(height: 10),
                Text('Catatan',
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                Text(paymentProof.catatan ?? 'Tidak ada catatan',
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDetailSection(
      {required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w600)),
          Text(value,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  Widget _buildStatusBadgeRow(String label, String status) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600)),
          _buildStatusBadge(status),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color statusColor = _getStatusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        _capitalize(status.replaceAll('_', ' ')),
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      // Status Booking
      case 'menunggu konfirmasi':
        return AppColors.bookingWaitingForConfirmation;
      case 'terkonfirmasi':
        return AppColors.bookingConfirmed;
      case 'terjadwal':
        return AppColors.bookingScheduled;
      case 'selesai':
        return AppColors.bookingCompleted;
      case 'ditolak':
        return AppColors.bookingRejected;

      // Status Pembayaran
      case 'belum bayar':
        return AppColors.transactionNotPaid;
      case 'pembayaran dp':
        return AppColors.transactionDownPayment;
      case 'lunas':
        return AppColors.transactionPaid;

      // Status Payment Proof
      case 'pending':
        return AppColors.paymentProofPending;
      case 'diterima':
        return AppColors.paymentProofAccepted;
      // ignore: unreachable_switch_case
      case 'ditolak':
        return AppColors.paymentProofRejected;

      default:
        return Colors.black;
    }
  }

  String _capitalize(String text) {
    if (text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
