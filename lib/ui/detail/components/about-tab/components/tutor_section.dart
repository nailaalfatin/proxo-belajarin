import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/mentor%20profile/Teacher_profile_screen.dart.dart';
import 'package:flutter/material.dart';

class TutorSection extends StatelessWidget {
  const TutorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tutor',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // Foto tutor
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TeacherProfileScreen()),
                );
              },
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage("assets/images/ethan-yasir.png"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ethan Yasir',
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Guru Matematika',
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Ikon telepon & chat
            IconButton(
              onPressed: () {
                // Aksi telepon
              },
              icon: Icon(
                Icons.phone,
                color: primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                // Aksi chat
              },
              icon: Icon(
                Icons.chat,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
