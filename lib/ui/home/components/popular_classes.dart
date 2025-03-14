import 'package:belajarin_app/models/classes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belajarin_app/providers/save_provider.dart';
import 'package:belajarin_app/consts.dart';

class PopularClasses extends StatelessWidget {
  final List<AllClass> popularData;

  const PopularClasses({super.key, required this.popularData});

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
                "Kelas Populer",
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

        // 3 item (vertical)
        Column(
          children: popularData.map((item) {
            return _buildPopularClass(context, item);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPopularClass(BuildContext context, AllClass item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            // Gambar
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  item.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.subject,
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.title,
                      style: const TextStyle(
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
            ),
            // Bookmark button menggunakan Provider
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Builder(
                builder: (context) {
                  // Dengan listen: true (default) agar widget rebuild saat data berubah.
                  final saveProvider = Provider.of<SaveProvider>(context);
                  bool isSaved = saveProvider.isSaved(item);
                  return IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      // Untuk aksi, kita bisa gunakan listen: false (opsional) jika ingin menghindari rebuild tambahan.
                      Provider.of<SaveProvider>(context, listen: false).toggleSaved(item);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
