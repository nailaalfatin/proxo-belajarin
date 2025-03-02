import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded( // Tambahkan Expanded di sini
          child: TextField(
            decoration: InputDecoration(
              hintText: "Cari Kursus",
              prefixIcon: const Icon(
                Icons.search, 
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(
          "assets/logos/filter.png",
          width: 50, // Tambahkan ukuran agar tidak terlalu besar
          height: 50,
        ),
      ],
    );
  }
}
