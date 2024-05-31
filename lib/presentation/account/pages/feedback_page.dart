// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/bloc/feedback/feedback_bloc.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _judulcontroller = TextEditingController();
  final TextEditingController _pesancontroller = TextEditingController();
  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();

  @override
  void dispose() {
    _judulcontroller.dispose();
    _pesancontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Kirim Feedback',
        backgroundColor: AppColors.appBarBackgroundColor,
        textColor: AppColors.appBarTextColor,
        iconColor: AppColors.appBarIconColor,
        statusBarBrightness: Brightness.dark,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<FeedbackBloc, FeedbackState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(child: Text(message)),
                    backgroundColor: AppColors.successColor,
                  ),
                );
                setState(() {
                  _judulcontroller.clear();
                  _pesancontroller.clear();
                });
              },
              failure: (errorMessage) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Center(
                        child: Text(errorMessage),
                      ),
                      backgroundColor: AppColors.dangerColor),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return SingleChildScrollView(
              // Memastikan form dapat di-scroll
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/feedback_image.png',
                        width: 300),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Jika Anda memiliki saran atau masukan yang dapat membantu kami meningkatkan layanan, silakan kirimkan melalui formulir di bawah ini.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _judulcontroller,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Masukkan judul feedback Anda...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _pesancontroller,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Tulis pesan Anda di sini...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  state.maybeWhen(
                    orElse: () => Button.filled(
                      onPressed: () => _submitFeedback(context),
                      label: 'Kirim Feedback',
                      width: MediaQuery.of(context)
                          .size
                          .width, // Sesuaikan lebar dengan lebar layar
                      height: 45.0,
                      borderRadius:
                          0, // Sesuaikan nilai borderRadius sesuai kebutuhan
                      fontSize: 18.0,
                      color: Colors
                          .black, // Sesuaikan warna tombol sesuai kebutuhan
                    ),
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _submitFeedback(BuildContext context) async {
    final authData = await _authLocalDataSource.getAuthData();
    if (authData != null && authData.user != null) {
      context.read<FeedbackBloc>().add(
            FeedbackEvent.submitFeedback(
              judul: _judulcontroller.text,
              pesan: _pesancontroller.text,
              userId: authData.user!.id!,
            ),
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User tidak ditemukan.')),
      );
    }
  }
}
