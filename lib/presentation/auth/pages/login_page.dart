import 'package:flutter/material.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/buttons.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/components/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Masuk!',
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontFamily: 'Montserrat',
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ceritakan Kisah Anda Melalui Foto',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: AppColors.subHeadingColor,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'yang Menakjubkan',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: AppColors.subHeadingColor,
                ),
              ),
              const SizedBox(height: 40),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: true,
                      borderRadius: 0,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 15.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: (data) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                            );
                          },
                          error: (message) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(child: Text(message)),
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
                                  passwordController.text.trim().isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Email dan password wajib diisi.',
                                    ),
                                  ),
                                );
                              } else {
                                context.read<LoginBloc>().add(
                                      LoginEvent.login(
                                        emailController.text,
                                        passwordController.text,
                                      ),
                                    );
                              }
                            },
                            label: 'Masuk',
                            width: 400,
                            height: 45.0,
                            borderRadius: 15,
                            fontSize: 18.0,
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
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Ayo, jadikan momenmu tak terlupakan! ',
                          style: TextStyle(
                            color: AppColors.bodyTextColor,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Daftar sekarang',
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
            ],
          ),
        ),
      ),
    );
  }
}
