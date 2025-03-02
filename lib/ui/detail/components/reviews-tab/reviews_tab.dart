import 'package:belajarin_app/ui/detail/components/reviews-tab/components/review_data.dart';
import 'package:belajarin_app/ui/detail/components/reviews-tab/components/review_filter_button.dart';
import 'package:belajarin_app/ui/detail/components/reviews-tab/components/review_item.dart';
import 'package:flutter/material.dart';
import 'package:belajarin_app/consts.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data ulasan dari review_data.dart
    final List<Map<String, dynamic>> reviews = reviewData;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Ulasan (45) dan Lihat Semua
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Ulasan (45)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Lihat Semua",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // TextField untuk "Cari di ulasan"
            TextField(
              decoration: InputDecoration(
                hintText: "Cari di ulasan",
                prefixIcon: const Icon(Icons.search),
                fillColor: const Color(0xFFF4F6F9),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Filter row: Filter, Terverifikasi, Terbaru, Ulasan terperinci
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ReviewFilterButton(
                    icon: Icons.filter_list,
                    label: "Filter",
                  ),
                  ReviewFilterButton(label: "Terverifikasi"),
                  ReviewFilterButton(label: "Terbaru"),
                  ReviewFilterButton(label: "Ulasan terperinci"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Daftar ulasan
            Column(
              children: reviews
                  .map((item) => ReviewItem(reviewData: item))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
