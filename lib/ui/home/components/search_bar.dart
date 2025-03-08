import 'package:belajarin_app/ui/search%20page/serach_page_screen.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _navigateToSearchPage(context);
            },
            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari Kursus",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFEAEAEA)),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(
          "assets/logos/filter.png",
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  void _navigateToSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
  }
}
