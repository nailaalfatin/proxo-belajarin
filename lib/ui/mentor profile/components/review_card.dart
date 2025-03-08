import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String comment;
  final String likes;
  final String time;

  const ReviewCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.comment,
    required this.likes,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  imagePath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), 
                        side: BorderSide(color: primaryColor, width: 1.5), 
                      ),
                      color: Colors.white,
                      elevation: 0, 
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: primaryColor, size: 16,),
                            SizedBox(width: 4),
                            Text(
                              "5",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: primaryColor
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(comment, style: TextStyle(color: Colors.black),),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.favorite_border, color: Colors.black),
              const SizedBox(width: 5),
              Text(likes, style: TextStyle(color: Colors.black),),
              const SizedBox(width: 20),
              Text(time, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
