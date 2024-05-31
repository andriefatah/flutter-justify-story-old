// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/register_request_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              SizedBox(height: 30),
              Text(
                'Daftar!',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ceritakan Kisah Anda Melalui Foto',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: AppColors.subHeadingColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'yang Menakjubkan',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: AppColors.subHeadingColor,
                ),
              ),
              SizedBox(height: 40),

              // Registration Form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: nameController,
                      label: 'Name',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.person),
                      borderRadius: 0,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 15.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: phoneController,
                      label: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icon(Icons.phone),
                      borderRadius: 0,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 15.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: addressController,
                      label: 'Address',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.home),
                      borderRadius: 0,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 15.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email),
                      borderRadius: 0,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 15.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(Icons.lock),
                      obscureText: true,
                      borderRadius: 0,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 15.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Center(child: Text('Pendaftaran berhasil!')),
                              backgroundColor: AppColors.successColor,
                            ));

                            // Tunggu selama 10 detik sebelum mengarahkan ke halaman login
                            Future.delayed(Duration(seconds: 3), () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            });
                          },
                          error: (errors) {
                            final emailError = errors['email']?.join(' ') ?? '';
                            final passwordError =
                                errors['password']?.join(' ') ?? '';
                            final errorMessage = emailError +
                                (emailError.isNotEmpty ? '\n' : '') +
                                passwordError;

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(child: Text(errorMessage)),
                              backgroundColor: AppColors.dangerColor,
                            ));
                          },
                          orElse: () {},
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(orElse: () {
                          return Button.filled(
                            onPressed: () {
                              if (emailController.text.trim().isEmpty ||
                                  passwordController.text.trim().isEmpty ||
                                  nameController.text.trim().isEmpty ||
                                  phoneController.text.trim().isEmpty ||
                                  addressController.text.trim().isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Semua field wajib diisi.',
                                    ),
                                  ),
                                );
                              } else {
                                final requestModel = RegisterRequestModel(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  alamat: addressController.text,
                                  noTelp: phoneController.text,
                                );
                                context.read<RegisterBloc>().add(
                                      RegisterEvent.register(requestModel),
                                    );
                              }
                            },
                            label: 'Daftar',
                            width: 400,
                            height: 45.0,
                            fontSize: 18.0,
                            color: AppColors.buttonBackgroundColor,
                          );
                        }, loading: () {
                          return const Center(
                              child: CircularProgressIndicator());
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Login Button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: const [
                        TextSpan(
                          text: 'Sudah punya akun? ',
                          style: TextStyle(
                            color: AppColors.bodyTextColor,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Masuk disini',
                          style: TextStyle(
                            color: AppColors.linkTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
