import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              "Selamat Pagi, Jenna 👋",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(LucideIcons.calendar, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(LucideIcons.bell, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(LucideIcons.bookmark, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildPointsAndRanking(),
            const SizedBox(height: 20),
            _buildPromoBanner(),
            const SizedBox(height: 20),
            _buildRecommendationSection(),
            const SizedBox(height: 20),
            _buildPopularClasses(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Cari Kursus",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildPointsAndRanking() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoTile("Point", "420", LucideIcons.coins),
          _buildInfoTile("Ranking", "6", LucideIcons.medal),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          "Diskon 45% dengan membeli kursus ini sekarang juga",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildRecommendationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Rekomendasi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Lihat Semua", style: TextStyle(color: Colors.blue)),
          ],
        ),
        const SizedBox(height: 10),
        // Dummy Recommendation List
        Container(
          height: 120,
          color: Colors.grey[300],
        ),
      ],
    );
  }

  Widget _buildPopularClasses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Kelas Populer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Lihat Semua", style: TextStyle(color: Colors.blue)),
          ],
        ),
        const SizedBox(height: 10),
        // Dummy Popular Classes List
        Container(
          height: 120,
          color: Colors.grey[300],
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
        BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Kelas Ku"),
        BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Inbox"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Pembelian"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
    );
  }
}