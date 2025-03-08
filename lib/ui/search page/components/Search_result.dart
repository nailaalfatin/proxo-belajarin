import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  final String searchQuery;
  final int resultCount;

  const SearchResultScreen({
    super.key,
    required this.searchQuery,
    required this.resultCount,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Untuk Menampilkan: $searchQuery",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "$resultCount Ditemukan",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          Center(
            child: Align(
              alignment: Alignment.center, 
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  Image.asset(
                    "assets/images/illust-not-found.png",
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Tidak Ditemukan",
                    textAlign:
                        TextAlign.center, 
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16), 
                   child: Text(
                      "Maaf! Kata kunci yang Anda masukkan tidak dapat ditemukan, silakan periksa kembali atau cari dengan kata kunci lain.",
                      textAlign:
                          TextAlign.center, 
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
