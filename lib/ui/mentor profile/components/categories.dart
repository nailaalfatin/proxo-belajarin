import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/mentor%20profile/components/course_tab.dart';
import 'package:belajarin_app/ui/save-material/components/course_model.dart';
import 'package:flutter/material.dart';

class CategoriesMentor extends StatefulWidget {
  const CategoriesMentor({super.key});

  @override
  State<CategoriesMentor> createState() => _CategoriesMentorState();
}

class _CategoriesMentorState extends State<CategoriesMentor> {
  int selectedIndex = 0;

  final List<Course> sampleCourses = [
    Course(
      title: "Matematika",
      category: "Mobile Development",
      imageUrl: "assets/images/logika-matematika.png",
      rating: 4.5,
    ),
    Course(
      title: "Metmatika",
      category: "Logika Matematika",
      imageUrl: "assets/images/logika-matematika.png",
      rating: 4.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * 0.99;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 25),
            _buildNavbar(),
            const SizedBox(height: 5),
            Flexible(
              child: SizedBox(
                width: containerWidth,
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    SingleChildScrollView(
                      child: CourseTab(courses: sampleCourses),
                    ),
                    const Center(
                      child: Text("👩‍🎓 Siswa", style: TextStyle(fontSize: 20)),
                    ),
                    const Center(
                      child: Text("⭐ Ulasan", style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNavbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _navItem("Kursus", 0),
        _navItem("Siswa", 1),
        _navItem("Ulasan", 2),
      ],
    );
  }

  Widget _navItem(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 14,
              color: selectedIndex == index ? primaryColor : Colors.grey,
              fontWeight: selectedIndex == index ? FontWeight.w700 : FontWeight.w500,
            ),
            child: Text(text),
          ),
          const SizedBox(height: 10),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 90,
            height: 3,
            decoration: BoxDecoration(
              color: selectedIndex == index ? primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
