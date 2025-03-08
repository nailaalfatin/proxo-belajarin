import 'package:belajarin_app/ui/save-material/components/course_model.dart';
import 'package:flutter/material.dart';

class CourseList extends StatelessWidget {
  final String category;

  CourseList({super.key, required this.category});

  final List<Course> sampleCourses = [
    Course(
      title: "Flutter Development",
      category: "Mobile Development",
      imageUrl: "assets/images/flutter.png",
      rating: 4.7,
    ),
    Course(
      title: "React Native",
      category: "Mobile Development",
      imageUrl: "assets/images/react_native.png",
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Course> filteredCourses = sampleCourses
        .where((course) => course.category == category)
        .take(2) 
        .toList();

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: filteredCourses.length,
        itemBuilder: (context, index) {
          final course = filteredCourses[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image.asset(course.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(course.title, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(course.rating.toString(), style: const TextStyle(fontSize: 14)),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
                // Tambahkan navigasi ke detail kursus nanti
              },
            ),
          );
        },
      ),
    );
  }
}
