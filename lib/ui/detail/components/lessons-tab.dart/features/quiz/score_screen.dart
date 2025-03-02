import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ScoreScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = (score / totalQuestions) * 100;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Hasil Kuis"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tampilkan skor
              Text(
                "Skor Kamu: $score / $totalQuestions",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Persentase
              Text(
                "(${percentage.toStringAsFixed(1)}%)",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 32),

              // Tombol Kembali / Selesai
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // atau Navigator.pushAndRemoveUntil(...) 
                  // jika mau kembali ke halaman awal.
                },
                child: const Text("Kembali"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
