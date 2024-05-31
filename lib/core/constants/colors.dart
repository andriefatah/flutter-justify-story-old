// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppColors {
  // Primary and Secondary Colors
  static const Color primaryColor = Color(0xff242424);
  static const Color secondaryColor = Color(0xff242424);

  // Background Colors
  static const Color backgroundColor = Color(0xff191919);
  static const Color textfieldBackgroundColor = Color(0xFFF3F3ED);

  // Button Colors
  static const Color buttonTextColor = Color(0xffffffff);
  static const Color buttonBackgroundColor = Color(0xff000000);
  static const Color buttonAlternativeColor =
      Color(0xff557ADB); // Example of an alternative button color

  // Text Colors
  static const Color headingColor = Color(0xff191919);
  static const Color subHeadingColor = Color(0xFF8F8989);
  static const Color bodyTextColor = Color(0xFFB1B1B1);
  static const Color linkTextColor = Color(0xFF000000);
  static const Color categoryTextColor = Color(0xFF9E9E9E);
  static const Color priceColor = Color(0xff557ADB);

  // Status Colors
  static const Color dangerColor = Color(0xffEF3826);
  static const Color warningColor = Color(0xffFFA756);
  static const Color infoColor = Color(0xff00B69B);
  static const Color successColor = Color(0xff00B69B);

// Booking Status Colors
  static const Color bookingWaitingForConfirmation =
      Color(0xffFFA756); // menunggu konfirmasi
  static const Color bookingConfirmed = Color(0xff00B69B); // terkonfirmasi
  static const Color bookingScheduled = Color(0xff557ADB); // terjadwal
  static const Color bookingCompleted = Color(0xff00B69B); // selesai
  static const Color bookingRejected = Color(0xffEF3826); // ditolak

  // Transaction Status Colors
  static const Color transactionWaitingForConfirmation =
      Color(0xffFFA756); // menunggu konfirmasi
  static const Color transactionNotPaid = Color(0xffEF3826); // belum bayar
  static const Color transactionDownPayment =
      Color(0xffFFA756); // pembayaran dp
  static const Color transactionPaid = Color(0xff00B69B); // lunas

  // Payment Proof Status Colors
  static const Color paymentProofPending = Color(0xffFFA756); // pending
  static const Color paymentProofAccepted = Color(0xff00B69B); // diterima
  static const Color paymentProofRejected = Color(0xffEF3826); // ditolak

  // AppBar Colors
  static const Color appBarBackgroundColor = Color(0xff000000); // Black
  static const Color appBarTextColor = Color(0xffffffff); // White
  static const Color appBarIconColor = Color(0xffffffff); // White
}
