import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const InfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 14,
          ) ??
              const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: Colors.black,
              ) ??
              const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
