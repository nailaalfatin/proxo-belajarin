import 'package:belajarin_app/ui/detail/components/about-tab/components/course_description_section.dart';
import 'package:belajarin_app/ui/detail/components/about-tab/components/info_section.dart';
import 'package:belajarin_app/ui/detail/components/about-tab/components/tutor_section.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      // Inline padding tanpa konstanta global
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Deskripsi kursus
          CourseDescriptionSection(),
          SizedBox(height: 30),

          // Bagian Tutor
          TutorSection(),
          SizedBox(height: 30),

          // Bagian Info
          InfoSection(),
        ],
      ),
    );
  }
}
