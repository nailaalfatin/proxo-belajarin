// file: quiz_question_screen.dart
import 'dart:async';
import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/quiz/question/components/question_data.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/quiz/question/components/question_dots_indicator.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/quiz/question/components/question_option_list.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/quiz/score_screen.dart';
import 'package:flutter/material.dart';

class QuizQuestionScreen extends StatefulWidget {
  final String quizTitle;

  const QuizQuestionScreen({
    super.key,
    required this.quizTitle,
  });

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  /// Ambil data kuis dari quiz_data.dart
  final List<Map<String, dynamic>> questions = quizQuestions;

  int currentIndex = 0;
  int? selectedOption;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final isLastQuestion = (currentIndex == totalQuestions - 1);
    final currentQuestion = questions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.quizTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Dots indicator di atas
            QuestionDotsIndicator(
              totalQuestions: totalQuestions,
              currentIndex: currentIndex,
            ),
            const SizedBox(height: 16),

            // Tampilkan pertanyaan
            Text(
              currentQuestion["question"],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Jika ada gambar, tampilkan
            if (currentQuestion["image"] != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Image.asset(
                  currentQuestion["image"],
                  height: 150,
                ),
              ),
            const SizedBox(height: 8),

            // Tampilkan opsi jawaban
            QuestionOptionList(
              options: List<String>.from(currentQuestion["options"]),
              selectedOption: selectedOption,
              onOptionSelected: (index) {
                setState(() {
                  selectedOption = index;
                });
              },
            ),
          ],
        ),
      ),

      // Tombol "Lanjut" atau "Selesai" di ujung kanan bawah
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 34, 
            vertical: 12
            ),
          elevation: 0,
        ),
        onPressed: () {
          if (selectedOption == null) {
            _showAutoDismissBanner(context);
            return;
          }

          // Cek jawaban benar
          if (selectedOption == currentQuestion["answerIndex"]) {
            _score++;
          }

          if (!isLastQuestion) {
            // Pindah ke soal berikut
            setState(() {
              currentIndex++;
              selectedOption = null;
            });
          } else {
            // Soal terakhir, ke ScoreScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ScoreScreen(
                  score: _score,
                  totalQuestions: totalQuestions,
                ),
              ),
            );
          }
        },
        child: Text(
          isLastQuestion ? "Selesai" : "Lanjut",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  /// Menampilkan MaterialBanner di atas, tertutup otomatis setelah 3 detik
  void _showAutoDismissBanner(BuildContext context) {
    // Tutup banner lama, jika ada
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

    final banner = MaterialBanner(
      backgroundColor: primaryColor,
      content: const Text(
        "Pilih jawaban dulu, ya!",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      // Minimal satu aksi harus ada
      actions: [
        TextButton(
          onPressed: () {
            // Tutup banner saat tombol ditekan
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );

    // Tampilkan banner
    ScaffoldMessenger.of(context).showMaterialBanner(banner);

    // Tutup otomatis setelah 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    });
  }
}
