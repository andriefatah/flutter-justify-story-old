import 'package:flutter/material.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/pages/home_page.dart';
// import 'package:flutter_reservasi_foto_justify_story_app/presentation/widget/main_layout.dart';

class FailBookingPage extends StatelessWidget {
  final String message;

  const FailBookingPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 100, color: Colors.red),
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
