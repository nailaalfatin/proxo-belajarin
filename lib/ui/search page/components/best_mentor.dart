import 'package:flutter/material.dart';

class BestMentor extends StatelessWidget {
  const BestMentor({super.key});

  final List<Map<String, String>> mentors = const [
    {
      "name": "DjokoRahman",
      "image": "assets/images/Djoko.png",
      "job": "Guru Biologi"
    },
    {
      "name": "Aina", 
      "image": "assets/images/aina.png", 
      "job": "Guru Bahasa"},
    {
      "name": "Andi Wijaya",
      "image": "assets/images/lina.png",
      "job": "Guru Matematika"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: _buildMentorCard(mentors[index]["name"]!,
                mentors[index]["image"]!, mentors[index]["job"]!),
          );
        },
      ),
    );
  }

  Widget _buildMentorCard(String name, String imagePath, String job) {
    return Material(
      elevation: 4, 
      borderRadius: BorderRadius.circular(15),
      shadowColor: Colors.black.withOpacity(0.2),
      child: Container(
        width: 160,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5),
                        Image.asset(
                          "assets/images/verify.png",
                          width: 16,
                          height: 16,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      job,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
