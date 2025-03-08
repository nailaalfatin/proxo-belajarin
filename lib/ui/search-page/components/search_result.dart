import 'package:belajarin_app/models/classes.dart';
import 'package:belajarin_app/providers/save_provider.dart';
import 'package:flutter/material.dart';
import 'package:belajarin_app/consts.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  final String searchQuery;
  final List<AllClass> results;

  const SearchResult({
    super.key,
    required this.searchQuery,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header hasil pencarian
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Hasil untuk ',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "\"$searchQuery\"",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF335EF8),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${results.length} Ditemukan",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF335EF8),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: results.isEmpty ? _buildNotFound() : _buildResultsList(),
        ),
      ],
    );
  }

  Widget _buildNotFound() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/illust-not-found.png"),
          const SizedBox(height: 40),
          const Text(
            "Tidak Ditemukan",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Maaf! Kata kunci yang Anda masukkan tidak dapat ditemukan, silakan periksa kembali atau cari dengan kata kunci lain.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ClassCard(allClass: results[index]);
      },
    );
  }
}

class ClassCard extends StatelessWidget {
  final AllClass allClass;
  const ClassCard({super.key, required this.allClass});

  @override
  Widget build(BuildContext context) {
    final saveProvider = Provider.of<SaveProvider>(context);
    bool isSaved = saveProvider.isSaved(allClass);

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
            // Gambar kelas
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  allClass.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Informasi kelas
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allClass.subject,
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      allClass.title,
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
                          allClass.rating.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Tombol bookmark
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: primaryColor,
                ),
                onPressed: () {
                  saveProvider.toggleSaved(allClass);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
