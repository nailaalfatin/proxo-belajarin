import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget { 
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Semua",
    "Matematika",
    "Fisika",
    "Kimia",
    "Biologi"
  ];

  int selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 12),
      child: SizedBox(
        height: 50,
        child: ListView.builder( 
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildCategory(index)
          ),
      ),
    );
  }

  GestureDetector _buildCategory(int index) { 
    return GestureDetector( 
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
             decoration: BoxDecoration(
              color: selectedIndex == index? primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selectedIndex == index? Colors.transparent : primaryColor,
                width: 1
              )
              ),
                child: Column(
                  children: [
                    const SizedBox(width: 3),
                    Text(
                      categories[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: selectedIndex == index? Colors.white : primaryColor
                      ),
                    ),
                  ],
                ),
              ),
            
            ],
          ),
        ),
      );
  }
}