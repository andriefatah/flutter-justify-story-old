// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/extensions/int_ext.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/bloc/payment_method/payment_method_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/pages/upload_payment_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/payment_method_response_model.dart';

class PaymentProcessPage extends StatefulWidget {
  final int transactionId;
  final double sisaPiutang;

  const PaymentProcessPage({
    super.key,
    required this.transactionId,
    required this.sisaPiutang,
  });

  @override
  _PaymentProcessPageState createState() => _PaymentProcessPageState();
}

class _PaymentProcessPageState extends State<PaymentProcessPage> {
  int? _selectedPaymentMethodId;
  late double _currentSisaPiutang;
  late bool _isDP;

  @override
  void initState() {
    super.initState();
    _currentSisaPiutang = widget.sisaPiutang;
    _isDP = false;
    _updateSisaPiutang();
  }

  void _updateSisaPiutang() {
    setState(() {
      if (_isDP) {
        _currentSisaPiutang = widget.sisaPiutang / 2;
      } else {
        _currentSisaPiutang = widget.sisaPiutang;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Proses Pembayaran',
        backgroundColor: AppColors.appBarBackgroundColor,
        textColor: AppColors.appBarTextColor,
        iconColor: AppColors.appBarIconColor,
        statusBarBrightness: Brightness.dark,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (paymentMethods) => Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPaymentMethodList(paymentMethods),
                      const SizedBox(height: 20),
                      _buildPaymentOptions(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jumlah Pembayaran:',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          _currentSisaPiutang.currencyFormatRp,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: AppColors.priceColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Button.filled(
                          onPressed: () {
                            if (_selectedPaymentMethodId != null) {
                              final selectedMethod = paymentMethods.firstWhere(
                                (method) =>
                                    method.id == _selectedPaymentMethodId,
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UploadPaymentPage(
                                    transactionId: widget.transactionId,
                                    selectedPaymentMethod: selectedMethod,
                                    selectedPaymentAmount: _currentSisaPiutang,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Mohon pilih metode pembayaran terlebih dahulu',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          label: 'Unggah Bukti Pembayaran',
                          height: 45.0,
                          borderRadius: 20.0,
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Opsi Pembayaran',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          ListTile(
            title: const Text('Bayar DP'),
            leading: Radio<bool>(
              value: true,
              groupValue: _isDP,
              onChanged: (bool? value) {
                setState(() {
                  _isDP = value!;
                  _updateSisaPiutang();
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Bayar Lunas'),
            leading: Radio<bool>(
              value: false,
              groupValue: _isDP,
              onChanged: (bool? value) {
                setState(() {
                  _isDP = value!;
                  _updateSisaPiutang();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodList(
      List<PaymentMethodResponseModel> paymentMethods) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilih Metode Pembayaran',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: paymentMethods.length,
          itemBuilder: (context, index) {
            final paymentMethod = paymentMethods[index];
            final isSelected = paymentMethod.id == _selectedPaymentMethodId;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPaymentMethodId = paymentMethod.id;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 2.0,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        paymentMethod.gambar ?? '',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              paymentMethod.nama ?? '',
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Nomor: ${paymentMethod.nomor}',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Atas Nama: ${paymentMethod.atasNama}',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
