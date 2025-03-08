import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/quiz/question/components/question_data.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/quiz/question/components/question_option_list.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/quiz/score_screen.dart';
import 'package:flutter/material.dart';

class QuizQuestionScreen extends StatefulWidget {
  final String quizTitle;

  const QuizQuestionScreen({super.key, required this.quizTitle});

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  // Data soal kuis
  final List<Map<String, dynamic>> questions = quizQuestions;

  // Inisialisasi list jawaban user dengan panjang yang sudah ditentukan, semua nilai awal null
  final List<int?> userAnswers =
      List<int?>.filled(quizQuestions.length, null, growable: false);

  int currentIndex = 0;
  int? selectedOption;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = questions.length;
    final bool isLastQuestion = (currentIndex == totalQuestions - 1);
    final Map<String, dynamic> currentQuestion = questions[currentIndex];

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
            // Tampilkan pertanyaan
            Text(
              currentQuestion["question"],
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Tampilkan gambar jika ada (opsional)
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
                  userAnswers[currentIndex] = index;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: const Color(0xFF1E3A8A),
          padding:
              const EdgeInsets.symmetric(horizontal: 34, vertical: 12),
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
            // Pindah ke soal berikutnya
            setState(() {
              currentIndex++;
              selectedOption = null;
            });
          } else {
            // Soal terakhir, pindah ke ScoreScreen dan kirim data jawaban
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ScoreScreen(
                  score: _score,
                  totalQuestions: totalQuestions,
                  questions: questions,
                  userAnswers: userAnswers,
                ),
              ),
            );
          }
        },
        child: Text(
          isLastQuestion ? "Selesai" : "Lanjut",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat,
    );
  }

  void _showAutoDismissBanner(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

    final banner = MaterialBanner(
      backgroundColor: const Color(0xFF1E3A8A),
      content: const Text(
        "Pilih jawaban dulu, ya!",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      actions: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );

    ScaffoldMessenger.of(context).showMaterialBanner(banner);

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    });
  }
}