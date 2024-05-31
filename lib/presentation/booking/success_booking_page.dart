// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/main_page.dart';
// import 'package:flutter_reservasi_foto_justify_story_app/presentation/widget/main_layout.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessBookingPage extends StatelessWidget {
  final String message;

  const SuccessBookingPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/success.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 32),
              Text(
                'Sukses!',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'Anda akan diarahkan ke halaman utama dalam beberapa saat.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
