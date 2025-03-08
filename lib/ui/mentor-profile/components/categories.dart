import 'package:flutter/material.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatistic("25", "kursus"),
        _buildStatistic("8,1725", "siswa"),
        _buildStatistic("725", "ulasan"),
      ],
    );
  }

  Widget _buildStatistic(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16)),
      ],
    );
  }
}
