// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_app_bar.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_text_field.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/user_detail_update_request_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/account/bloc/user_detail/user_detail_bloc.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();
  int? userDetailId;

  @override
  void initState() {
    super.initState();
    context.read<UserDetailBloc>().add(const UserDetailEvent.getUserDetail());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profil Saya',
        backgroundColor: AppColors.appBarBackgroundColor,
        textColor: AppColors.appBarTextColor,
        iconColor: AppColors.appBarIconColor,
        statusBarBrightness: Brightness.dark,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                buildProfileForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileForm() {
    return BlocConsumer<UserDetailBloc, UserDetailState>(
      listener: (context, state) {
        state.whenOrNull(
          updateSuccess: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.successColor,
              ),
            );
            context
                .read<UserDetailBloc>()
                .add(const UserDetailEvent.getUserDetail());
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const CircularProgressIndicator(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (userDetail) {
            nameController.text = userDetail.name ?? '';
            emailController.text = userDetail.email ?? '';
            phoneController.text = userDetail.userDetail?.noTelp ?? '';
            addressController.text = userDetail.userDetail?.alamat ?? '';
            userDetailId = userDetail.userDetail?.id;

            return Column(
              children: [
                CustomTextField(
                  controller: nameController,
                  label: 'Nama',
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.person),
                  borderRadius: 0,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 15.0,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                  borderRadius: 0,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 15.0,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: phoneController,
                  label: 'No. Telepon',
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.phone),
                  borderRadius: 0,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 15.0,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: addressController,
                  label: 'Alamat',
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.home),
                  borderRadius: 0,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 15.0,
                  ),
                ),
                const SizedBox(height: 20),
                Button.filled(
                  onPressed: () async {
                    final authData = await _authLocalDataSource.getAuthData();
                    if (authData?.user != null) {
                      final data = UserDetailUpdateRequestModel(
                        userId: authData?.user!.id,
                        name: nameController.text,
                        email: emailController.text,
                        noTelp: phoneController.text,
                        alamat: addressController.text,
                      );

                      context.read<UserDetailBloc>().add(
                            UserDetailEvent.updateUserDetail(data),
                          );
                    } else {}
                  },
                  label: 'Ubah Data',
                  width: 400,
                  height: 45.0,
                  borderRadius: 15,
                  fontSize: 18.0,
                ),
              ],
            );
          },
          error: (message) => Center(
            child: Text(
              'Error: $message',
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.dangerColor,
              ),
            ),
          ),
          updateSuccess: (message) {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
