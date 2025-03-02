import 'package:flutter/material.dart';
import 'package:belajarin_app/consts.dart';

class QuestionDotsIndicator extends StatelessWidget {
  final int totalQuestions;
  final int currentIndex;

  const QuestionDotsIndicator({
    super.key,
    required this.totalQuestions,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalQuestions, (i) {
        Color dotColor;
        if (i < currentIndex) {
          dotColor = primaryColor; // Sudah dikerjakan
        } else if (i == currentIndex) {
          dotColor = Colors.orange; // Soal aktif (warna berbeda)
        } else {
          dotColor = Colors.grey; // Belum dikerjakan
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 45,
          height: 8,
          decoration: BoxDecoration(
            color: dotColor,
            borderRadius: BorderRadius.circular(15),
          ),
        );
      }),
    );
  }
}
