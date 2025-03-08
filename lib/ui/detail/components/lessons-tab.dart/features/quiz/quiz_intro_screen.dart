import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';
import 'question/quiz_question_screen.dart';

class QuizIntroScreen extends StatelessWidget {
  final String quizTitle;

  const QuizIntroScreen({
    super.key,
    required this.quizTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Latar putih agar sesuai desain
      backgroundColor: Colors.white,

      // AppBar
      appBar: AppBar(
        title: Text(
          quizTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // Warna ikon back
        centerTitle: true,
        elevation: 0,
      ),

      // Konten utama
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Jeda di atas ilustrasi
            const SizedBox(height: 150),

            // Ilustrasi
            Image.asset(
              'assets/logos/quiz_intro.png', // Sesuaikan path ilustrasi
              height: 220,                   // Sesuaikan ukuran
            ),
            const SizedBox(height: 32),

            // Judul "Mulai Kuis?"
            const Text(
              "Mulai Kuis?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),

            // Deskripsi
            const Text(
              "Seru dan menantang! Jawab kuis ini\n"
              "dan raih skor tertinggi!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            // Spacer agar tombol di bagian bawah
            const Spacer(),

            // Tombol "Mulai Sekarang"
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: primaryColor, // Ganti warna sesuai brand
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizQuestionScreen(quizTitle: quizTitle),
                    ),
                  );
                },
                child: const Text(
                  "Mulai Sekarang",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Jeda di bawah tombol
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
