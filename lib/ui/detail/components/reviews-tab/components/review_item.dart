// file: review_item.dart
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final Map<String, dynamic> reviewData;

  const ReviewItem({
    super.key,
    required this.reviewData,
  });

  @override
  Widget build(BuildContext context) {
    final String name = reviewData["name"];
    final String review = reviewData["review"];
    final int likes = reviewData["likes"];
    final String time = reviewData["time"];
    final String profileImage = reviewData["profileImage"];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris pertama: foto profil, nama, dan rating
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(profileImage),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Image.asset(
                "assets/logos/5-star.png",
                width: 45,
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Isi ulasan
          Text(
            review,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),

          // Baris bawah: jumlah likes dan waktu ulasan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.favorite_border, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    likes.toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
