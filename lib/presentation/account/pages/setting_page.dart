// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/auth_response_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/main_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/pages/about_me_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/pages/feedback_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/pages/my_profile_page.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/pages/login_page.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  AuthLocalDataSource authLocalDataSource = AuthLocalDataSource();
  AuthResponseModel? authResponse;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    authResponse = await authLocalDataSource.getAuthData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pengaturan',
        onBackButtonPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocListener<LogoutBloc, LogoutState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {},
              success: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logout berhasil!'),
                    backgroundColor: AppColors.successColor,
                  ),
                );
                // Mengarahkan pengguna ke LoginPage setelah menampilkan SnackBar
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LoginPage()), // Pastikan Anda memiliki class LoginPage() yang didefinisikan
                  );
                });
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: AppColors.dangerColor,
                  ),
                );
              },
            );
          },
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/personal_settings_image.png',
                    width: 300),
              ),
              const SizedBox(height: 16),
              _buildListTile(
                  context, Icons.person, 'Profil Saya', const MyProfilePage()),
              _buildDivider(),
              _buildListTile(
                  context, Icons.info, 'Tentang Kami', const AboutMePage()),
              _buildDivider(),
              _buildListTile(
                  context, Icons.feedback, 'Kirim Feedback', FeedbackPage()),
              _buildDivider(),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Keluar'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: GoogleFonts.poppins()),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey[300], height: 1);
  }
}
