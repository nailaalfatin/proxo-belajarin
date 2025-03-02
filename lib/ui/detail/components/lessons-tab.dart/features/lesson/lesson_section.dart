import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/quiz/quiz_intro_screen.dart';
import 'package:flutter/material.dart';
import 'lesson_item.dart';

class LessonSection extends StatelessWidget {
  final String sectionTitle;
  final String sectionDuration;
  final List<Map<String, dynamic>> items;
  final Function(String) onPlayVideo;

  const LessonSection({
    super.key,
    required this.sectionTitle,
    required this.sectionDuration,
    required this.items,
    required this.onPlayVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris judul section + durasi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                sectionDuration,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Daftar LessonItem
          Column(
            children: items.asMap().entries.map((entry) {
              final itemIndex = entry.key;
              final data = entry.value;
              // Tentukan apakah item adalah kuis berdasarkan judul
              final bool isQuiz = (data["title"]?.toString().toLowerCase().contains("kuis")) ?? false;
              if (isQuiz) {
                // Untuk kuis, tidak tampilkan tombol play
                return LessonItem(
                  index: itemIndex + 1,
                  title: data["title"] ?? "No Title",
                  time: data["time"] ?? "",
                  hidePlayButton: true,
                  onPlayPressed: () {},
                );
              } else {
                return LessonItem(
                  index: itemIndex + 1,
                  title: data["title"] ?? "No Title",
                  time: data["time"] ?? "",
                  hidePlayButton: false,
                  onPlayPressed: () {
                    if (data["videoUrl"] != null) {
                      onPlayVideo(data["videoUrl"]);
                    } else {
                      print("Tidak ada video untuk ${data["title"]}");
                    }
                  },
                );
              }
            }).toList(),
          ),
        ],
      ),
    );
  }
}
