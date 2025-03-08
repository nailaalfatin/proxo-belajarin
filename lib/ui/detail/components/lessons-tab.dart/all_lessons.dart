import 'package:flutter/material.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/lesson/lesson_data.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/lesson/video-player/components/inline_video_player.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/lesson/lesson_item.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/quiz/quiz_intro_screen.dart';

class AllLessonsScreen extends StatefulWidget {
  const AllLessonsScreen({super.key});

  @override
  State<AllLessonsScreen> createState() => _AllLessonsScreenState();
}

class _AllLessonsScreenState extends State<AllLessonsScreen> {
  String? _currentVideoUrl;

  void _handlePlayVideo(String videoUrl) {
    setState(() {
      _currentVideoUrl = videoUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pelajaran",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios, 
            color: Colors.black
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: lessonsData.map((section) {
            final sectionTitle = section["sectionTitle"] as String;
            final sectionDuration = section["sectionDuration"] as String;
            final items = section["items"] as List<Map<String, dynamic>>;
      
            // Apakah ini Bagian 1 atau Bagian 2?
            final bool isLessonSection = (sectionTitle == "Bagian 1 - Pendahuluan" ||
                sectionTitle == "Bagian 2 - Dasar - Dasar");
      
            // Apakah ini Latihan Soal?
            final bool isLatihanSoal = (sectionTitle == "Latihan Soal");
      
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
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
      
                // Daftar item
                Column(
                  children: items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final data = entry.value;
      
                    // Kumpulkan widget agar bisa sisipkan video di atas item
                    final widgets = <Widget>[];
      
                    // Jika item sedang diputar, tampilkan video inline
                    final hasVideo = (data["videoUrl"] != null);
                    if (_currentVideoUrl != null && hasVideo &&
                        data["videoUrl"] == _currentVideoUrl) {
                      widgets.add(
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InlineVideoPlayer(videoUrl: data["videoUrl"]!),
                        ),
                      );
                    }
      
                    // Apakah kita tampilkan ikon play?
                    // -> True jika "Bagian 1" atau "Bagian 2"
                    // -> False jika "Latihan Soal"
                    final bool hidePlayButton = !isLessonSection;
      
                    // Build item
                    widgets.add(
                      LessonItem(
                        index: index + 1,
                        title: data["title"] ?? "No Title",
                        time: data["time"] ?? "",
                        hidePlayButton: hidePlayButton,
                        onPlayPressed: () {
                          final title = data["title"] ?? "";
      
                          // 1) Jika "Fungsi Rasional" => play video
                          if (title == "Fungsi Rasional") {
                            if (hasVideo) {
                              _handlePlayVideo(data["videoUrl"]!);
                            } else {
                              print("Tidak ada video untuk Fungsi Rasional");
                            }
                          }
                          // 2) Jika "Kuis 1: Persamaan Rasional" => buka quiz
                          else if (title == "Kuis 1: Persamaan Rasional") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => QuizIntroScreen(
                                  quizTitle: title,
                                ),
                              ),
                            );
                          }
                          // 3) Selain itu => do nothing
                          else {
                            print("Tidak ada aksi untuk $title");
                          }
                        },
                      ),
                    );
      
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widgets,
                    );
                  }).toList(),
                ),
      
                const SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
