import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/lesson/lesson_data.dart';
import 'package:flutter/material.dart';
import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/lesson/lesson_section.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/all_lessons.dart';

class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Hitung total item
    final totalItems = lessonsData.fold<int>(
      0,
      (sum, section) => sum + (section["items"] as List).length,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris atas: Pelajaran (n) + Lihat Semua
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pelajaran ($totalItems)",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Buka halaman AllLessonsScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AllLessonsScreen(),
                    ),
                  );
                },
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Daftar beberapa section secara ringkas
          ...lessonsData.map((sec) {
            return LessonSection(
              sectionTitle: sec["sectionTitle"],
              sectionDuration: sec["sectionDuration"],
              items: sec["items"] as List<Map<String, dynamic>>,
              // onPlayVideo tidak kita gunakan di tab ringkasan
              onPlayVideo: (String url) {
                // Bisa tampilkan pesan, atau buka AllLessonsScreen, dsb.
                print("Play video (tab ringkasan): $url");
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
