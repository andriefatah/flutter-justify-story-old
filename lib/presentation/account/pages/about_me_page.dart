// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/bloc/about_me/about_me_bloc.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tentang Kami',
        backgroundColor: AppColors.appBarBackgroundColor,
        textColor: AppColors.appBarTextColor,
        iconColor: AppColors.appBarIconColor,
        statusBarBrightness: Brightness.dark,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<AboutMeBloc, AboutMeState>(
            builder: (context, state) {
              return state.when(
                initial: () => Center(
                    child: Text('Inisialisasi data...',
                        style: GoogleFonts.poppins())),
                loadInProgress: () =>
                    const Center(child: CircularProgressIndicator()),
                loadSuccess: (aboutMe) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/about_me_images.png',
                            width: 300),
                      ),
                      const SizedBox(height: 16),
                      Html(
                        data: aboutMe.deskripsi ?? '',
                        style: {
                          'body': Style(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.normal,
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                loadFailure: (errorMessage) => Center(
                    child: Text('Gagal memuat data: $errorMessage',
                        style: GoogleFonts.poppins())),
              );
            },
          ),
        ),
      ),
    );
  }
}
