// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/history_bookings_response_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/main_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/bloc/history_bookings/history_bookings_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/pages/detail_transaction_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class AllTransactionPage extends StatelessWidget {
  const AllTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Histori Booking',
        onBackButtonPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        },
      ),
      body: BlocBuilder<HistoryBookingsBloc, HistoryBookingsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (List<HistoryTransaction> transactions) =>
                transactions.isEmpty
                    ? Center(
                        child: Text(
                          'Belum Ada Booking',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : _buildTransactionList(transactions),
            error: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
    );
  }

  Widget _buildTransactionList(List<HistoryTransaction> transactions) {
    return Column(
      children: [
        // Align(
        //   alignment: Alignment.center,
        //   child: Image.asset('assets/images/booking_image.png', width: 300),
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              var transaction = transactions[index];
              return _buildTransactionItem(context, transaction);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(
      BuildContext context, HistoryTransaction transaction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                DateFormat('dd MMMM yyyy', 'id')
                    .format(transaction.createdAt ?? DateTime.now()),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: Divider(color: Colors.grey.shade400),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.package?.nama ?? 'Paket Tidak Diketahui',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Tanggal & Jam Foto: ${DateFormat('dd MMMM yyyy – HH:mm', 'id').format(transaction.tanggalJamFoto ?? DateTime.now())}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _buildStatusSection(
                      'Status Booking',
                      transaction.status ?? 'Status Tidak Diketahui',
                    ),
                  ),
                  const SizedBox(width: 20),
                  IntrinsicHeight(
                    // Gunakan Flexible di sini
                    child: _buildStatusSection(
                      'Status Pembayaran',
                      transaction.transaction?.statusPembayaran ??
                          'Status Tidak Diketahui',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Button.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailTransactionPage(transaction: transaction),
                      ),
                    );
                  },
                  label: 'Detail Booking',
                  height: 45.0,
                  borderRadius: 20.0,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusSection(String label, String status) {
    Color statusColor = _getStatusColor(status);
    String capitalizedStatus = _capitalize(status.replaceAll('_', ' '));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            capitalizedStatus,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.normal,
            ),
            overflow: TextOverflow.clip,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'menunggu konfirmasi':
        return AppColors.transactionWaitingForConfirmation;
      case 'belum bayar':
        return AppColors.transactionNotPaid;
      case 'pembayaran dp':
        return AppColors.transactionDownPayment;
      case 'lunas':
        return AppColors.transactionPaid;
      case 'terkonfirmasi':
        return AppColors.bookingConfirmed;
      case 'terjadwal':
        return AppColors.bookingScheduled;
      case 'selesai':
        return AppColors.bookingCompleted;
      case 'ditolak':
        return AppColors.bookingRejected;
      default:
        return Colors.black;
    }
  }

  String _capitalize(String text) {
    if (text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
