import 'package:flutter/material.dart';
import 'package:belajarin_app/consts.dart';

class CategoriesMentor extends StatefulWidget {
  const CategoriesMentor({super.key});

  @override
  State<CategoriesMentor> createState() => _CategoriesMentorState();
}

class _CategoriesMentorState extends State<CategoriesMentor> {
  int selectedIndex = 0;

  final List<String> categories = [
    "Kursus",
    "Murid",
    "Ulasan",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        _buildNavbar(),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildNavbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(categories.length, (index) {
        return _navItem(categories[index], index);
      }),
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
