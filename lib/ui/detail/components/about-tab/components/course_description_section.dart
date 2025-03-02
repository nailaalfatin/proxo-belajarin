import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class CourseDescriptionSection extends StatelessWidget {
  const CourseDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil textTheme agar styling teks konsisten
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tentang Kursus',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Belajarin adalah program pendidikan yang dirancang untuk '
          'mengajarkan keterampilan dan pengetahuan yang dibutuhkan '
          'dalam berbagai bidang, seperti',
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            // Aksi "Baca selengkapnya"
          },
          child: Text(
            'Baca selengkapnya',
            style: textTheme.bodyMedium?.copyWith(
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
