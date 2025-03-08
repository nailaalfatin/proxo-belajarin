import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Map<String, dynamic>> questions;
  final List<int?> userAnswers;

  const ScoreScreen({
    Key? key,
    required this.score,
    required this.totalQuestions,
    required this.questions,
    required this.userAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double percentage = (score / totalQuestions) * 100;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Jawaban"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              _buildScoreSection(percentage),
              const SizedBox(height: 20),

              // Generate item untuk setiap soal
              ...List.generate(questions.length, (index) {
                final question = questions[index];
                final int? userAnswerIndex = userAnswers[index];
                final int correctIndex = question["answerIndex"] as int;

                final alphaLabels = ["A", "B", "C", "D", "E"];
                final userChoiceLetter = (userAnswerIndex != null)
                    ? alphaLabels[userAnswerIndex]
                    : "";
                final userChoiceText = (userAnswerIndex != null)
                    ? question["options"][userAnswerIndex]
                    : "Tidak dijawab";
                final correctChoiceLetter = alphaLabels[correctIndex];
                final correctChoiceText = question["options"][correctIndex];

                // Benar/salah
                final bool isCorrect = (userAnswerIndex == correctIndex);

                return _buildQuestionItem(
                  index: index,
                  questionText: question["question"] ?? "",
                  imagePath: question["image"],
                  userChoiceLetter: userChoiceLetter,
                  userChoiceText: userChoiceText,
                  correctChoiceLetter: correctChoiceLetter,
                  correctChoiceText: correctChoiceText,
                  isCorrect: isCorrect,
                );
              }),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Selesai",
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreSection(double percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Score",
          style: TextStyle(
            fontSize: 22,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "$score dari $totalQuestions",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "(${percentage.toStringAsFixed(1)}%)",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.orange,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionItem({
    required int index,
    required String questionText,
    required String? imagePath,
    required String userChoiceLetter,
    required String userChoiceText,
    required String correctChoiceLetter,
    required String correctChoiceText,
    required bool isCorrect,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nomor + Teks pertanyaan
          Text(
            "${index + 1}. $questionText",
            style: const TextStyle(
              fontSize: 15, 
              fontWeight: FontWeight.bold,
            ),
          ),

          // Gambar (jika ada)
          if (imagePath != null) ...[
            const SizedBox(height: 8),
            Image.asset(
              imagePath,
              height: 100,
            ),
          ],

          const SizedBox(height: 8),
          const Text(
            "adalah...",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // ===============================
          // Container utama dengan radius
          // ===============================
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8), 
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =====================================================
                // Kotak kecil di kiri sebagai "garis" berwarna
                // =====================================================
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: isCorrect ? const Color(0xFF4CAF50) : Colors.red,
                    // Membulatkan sudut kiri
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                ),

                // =====================================================
                // Bagian isi jawaban user
                // =====================================================
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Baris pertama: Lingkaran huruf + teks jawaban
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                userChoiceLetter,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                userChoiceText,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // "Benar" / "Salah"
                        Text(
                          isCorrect ? "Benar" : "Salah",
                          style: TextStyle(
                            color: isCorrect ? const Color(0xFF4CAF50) : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Jawaban benar
                        Text(
                          "Jawaban benar : $correctChoiceLetter. $correctChoiceText",
                          style: const TextStyle(
                            fontSize: 14, 
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
