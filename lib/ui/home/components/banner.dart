import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Biar sudutnya melengkung
      child: Image.asset(
        "assets/images/banner.png", // Ganti dengan path gambar kamu
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
