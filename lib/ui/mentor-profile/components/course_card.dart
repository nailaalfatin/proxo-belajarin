import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String desc;
  final String star;

  const CourseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.desc, 
    required this.star,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                      Icon(Icons.bookmark_outlined, size: 20, color: primaryColor)
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(desc, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(star, style: const TextStyle(color: Colors.black, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
