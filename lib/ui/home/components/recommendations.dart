import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/models/classes.dart';
import 'package:flutter/material.dart';
import 'package:belajarin_app/ui/detail/detail_screen.dart';

class Recommendations extends StatelessWidget {
  final List<String> categories;
  final int selectedCategory;
  final ValueChanged<int> onCategorySelected;
  final List<AllClass> filteredClasses;

  const Recommendations({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.filteredClasses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Rekomendasi",
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
        const SizedBox(height: 15),

        // Kategori (Horizontal)
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedCategory == index;
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: GestureDetector(
                  onTap: () => onCategorySelected(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20, 
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryColor),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),

        // Daftar Card Horizontal
        SizedBox(
          height: 270,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filteredClasses.map((item) {
                return _buildRecommendationCard(item, context);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendationCard(AllClass item, BuildContext context) {
    // Hanya card dengan judul ini yang bisa di-klik
    bool isClickable = item.title == "Fungsi, Persamaan, dan Pertidaksamaan Rasional";

    return MouseRegion(
      // Jika card bisa diklik, gunakan kursor 'click'.
      // Jika tidak, gunakan kursor 'forbidden' (lingkaran dilarang).
      cursor: isClickable
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: isClickable
            ? () {
                // Navigasi ke DetailScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              }
            : null, // Jika null, card tidak bisa di-tap
        child: Container(
          width: 260,
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  item.imageUrl,
                  height: 140,
                  width: 260,
                  fit: BoxFit.cover,
                ),
              ),
              // Konten
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.subject,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          item.rating.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
