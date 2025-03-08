import 'package:flutter/material.dart';

class PopularClass extends StatelessWidget {
  const PopularClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Expanded( 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Fungsi, persamaan, dan tidak persamaan Raisonal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Matematika",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "⭐ 4.7 (1.242 Reviews)",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 13),
                Image.asset(
                  "assets/images/like-profile.png"
                )
              ],
            ),
          ),
          const SizedBox(width: 10), 
          Image.asset(
            "assets/images/mtk.png",
            width: 140,
            height: 160,
          ),
        ],
      ),
    );
  }
}
