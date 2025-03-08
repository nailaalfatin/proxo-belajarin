import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Buku Populer",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Lihat Semua",
                style: TextStyle(
                  fontSize: 14,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        _buildPopularBook(
          "Biologi",
          "Sistem Sirkulasi",
          "assets/images/all-book-1.png",
          4.8,
          primaryColor,
        ),
        _buildPopularBook(
          "Kimia",
          "Ikatan Kimia",
          "assets/images/all-book-2.png",
          4.7,
          primaryColor,
        ),
        _buildPopularBook(
          "Fisika",
          "Fluida: Statis",
          "assets/images/all-book-3.png",
          4.9,
          primaryColor,
        ),
      ],
    );
  }

  Widget _buildPopularBook(
      String subject, String title, String image, double rating, Color subjectColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0, 
        vertical: 8.0
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300, 
            width: 1.5
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 17, 15, 17),
                child: Image.asset(
                  image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: TextStyle(
                        fontSize: 12,
                        color: subjectColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.bookmark_border,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}