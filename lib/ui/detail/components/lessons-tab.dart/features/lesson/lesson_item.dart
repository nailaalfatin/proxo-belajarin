import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class LessonItem extends StatelessWidget {
  final int index;
  final String title;
  final String time;
  final bool hidePlayButton;
  final VoidCallback onPlayPressed;

  const LessonItem({
    Key? key,
    required this.index,
    required this.title,
    required this.time,
    required this.onPlayPressed,
    this.hidePlayButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayNumber = index < 10 ? "0$index" : "$index";

    return InkWell(
      onTap: onPlayPressed,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            // Lingkaran nomor
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFFD6DFFE),
                shape: BoxShape.circle,
              ),
              child: Text(
                displayNumber,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Judul
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),

            // Durasi
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
            const SizedBox(width: 8),

            // Ikon Play (muncul hanya jika hidePlayButton == false)
            if (!hidePlayButton)
              Icon(
                Icons.play_circle_fill,
                color: primaryColor,
                size: 30,
              ),
          ],
        ),
      ),
    );
  }
}
