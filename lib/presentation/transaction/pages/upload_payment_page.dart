// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/extensions/int_ext.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/payment_method_response_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/bloc/payment_proof/payment_proof_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/transaction/pages/success_payment_proof_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:image_picker/image_picker.dart';

class UploadPaymentPage extends StatefulWidget {
  final int transactionId;
  final PaymentMethodResponseModel selectedPaymentMethod;
  final double selectedPaymentAmount;

  const UploadPaymentPage({
    super.key,
    required this.transactionId,
    required this.selectedPaymentMethod,
    required this.selectedPaymentAmount,
  });

  @override
  _UploadPaymentPageState createState() => _UploadPaymentPageState();
}

class _UploadPaymentPageState extends State<UploadPaymentPage> {
  File? _selectedImage;
  final TextEditingController _noteController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _uploadPayment(BuildContext context) async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon unggah bukti pembayaran terlebih dahulu'),
        ),
      );
      return;
    }

    if (_noteController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon isi catatan'),
        ),
      );
      return;
    }

    final authData = await _authLocalDataSource.getAuthData();
    if (authData != null && authData.user != null) {
      context.read<PaymentProofBloc>().add(
            PaymentProofEvent.uploadPaymentProof(
              userId: authData.user!.id!,
              transactionId: widget.transactionId,
              fileBukti: _selectedImage!,
              nominal: widget.selectedPaymentAmount,
              metodePembayaran: widget.selectedPaymentMethod.nama.toString(),
              catatan: _noteController.text,
            ),
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User tidak ditemukan.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Unggah Bukti Pembayaran',
      ),
      body: BlocConsumer<PaymentProofBloc, PaymentProofState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (message) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SuccessPaymentProofPage(message: message),
                ),
              );
            },
            failure: (errorMessage) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Center(child: Text(errorMessage)),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/payment_image.png',
                    width: 300,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Silahkan Melakukan Transfer ke Rekening di bawah ini:',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      _buildPaymentDetails(),
                    ],
                  ),
                ),
                Text(
                  'Upload Bukti Pembayaran',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16.0),
                _buildFileUploadField(),
                const SizedBox(height: 32.0),
                const Text('Catatan Tambahan'),
                const SizedBox(height: 10),
                _buildNoteField(),
                const SizedBox(height: 32.0),
                state.maybeWhen(
                  orElse: () => Button.filled(
                    onPressed: () => _uploadPayment(context),
                    label: 'Unggah Pembayaran',
                    height: 45.0,
                    borderRadius: 20.0,
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Align(
                  child: Text(
                    'Mohon membayar sesuai dengan nominal di atas',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow(
              'Nama:', widget.selectedPaymentMethod.nama.toString()),
          const SizedBox(height: 8.0),
          _buildDetailRow(
              'Nomor:', widget.selectedPaymentMethod.nomor.toString()),
          const SizedBox(height: 8.0),
          _buildDetailRow(
              'Atas Nama:', widget.selectedPaymentMethod.atasNama.toString()),
          const SizedBox(height: 8.0),
          _buildDetailRow(
              'Nominal:', widget.selectedPaymentAmount.currencyFormatRp),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildFileUploadField() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Ambil dari Kamera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pilih dari Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Icon(Icons.file_upload, color: Colors.grey.shade600),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                _selectedImage == null
                    ? 'Unggah File (dari Kamera atau Galeri)'
                    : 'Gambar terpilih: ${_selectedImage!.path.split('/').last}',
                style: GoogleFonts.poppins(color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteField() {
    return Container(
      width: double.infinity,
      height: 120.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: TextFormField(
        controller: _noteController,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          hintText: 'Masukkan catatan tambahan di sini',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 15.0,
          ),
        ),
      ),
    );
  }
}
