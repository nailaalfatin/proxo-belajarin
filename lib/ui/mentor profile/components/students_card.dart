import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String status;

  const StudentCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                    Spacer(),
                    Image.asset("assets/images/telephone.png"),
                    SizedBox(width: 20,),
                    Image.asset("assets/images/message.png"),
                  ],
                ),
                const SizedBox(height: 4),
                Text(status, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
