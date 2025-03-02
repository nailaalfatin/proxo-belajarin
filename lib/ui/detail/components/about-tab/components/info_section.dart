import 'package:flutter/material.dart';
import 'info_item.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Info',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kolom kiri
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoItem(title: 'Siswa', value: '8,172'),
                  SizedBox(height: 16),
                  InfoItem(title: 'Pembaharuan Terakhir', value: 'Sep 04, 2024'),
                  SizedBox(height: 16),
                  InfoItem(title: 'Tingkat', value: 'Pemula'),
                ],
              ),
            ),
            SizedBox(width: 40),

            // Kolom kanan
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoItem(title: 'Bahasa', value: 'Indonesia'),
                  SizedBox(height: 16),
                  InfoItem(title: 'Bahasa', value: 'Indonesia & 5 lainnya'),
                  SizedBox(height: 16),
                  InfoItem(title: 'Akses', value: 'Ponsel, Desktop'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
