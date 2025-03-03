import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/save%20material/components/course_model.dart';
import 'package:flutter/material.dart';

class CourseTab extends StatelessWidget {
  final List<Course> courses;

  const CourseTab({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Card(
          color: Colors.white,
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 10), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(course.imageUrl, width: 100,),
                const SizedBox(width: 11), 
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              course.title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: primaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Text(course.title);
                            },
                            child: Icon(Icons.bookmark_outlined, color: primaryColor, size: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course.category,
                        style: const TextStyle(fontSize: 20, color:Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            "${course.rating}",
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
