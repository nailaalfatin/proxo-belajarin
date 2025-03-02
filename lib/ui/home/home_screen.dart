import 'package:belajarin_app/models/classes.dart';
import 'package:belajarin_app/ui/home/components/banner.dart';
import 'package:belajarin_app/ui/home/components/popular_books.dart';
import 'package:belajarin_app/ui/home/components/popular_classes.dart';
import 'package:belajarin_app/ui/home/components/recommendations.dart';
import 'package:belajarin_app/ui/home/components/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State kategori terpilih (0 = "Semua")
  int selectedCategory = 0;

  // Daftar kategori
  final List<String> categories = [
    "Semua",
    "Matematika",
    "Fisika",
    "Kimia",
    "Biologi",
  ];

  @override
  Widget build(BuildContext context) {
    // 1. Filter data sesuai kategori
    List<AllClass> filteredClasses;
    if (selectedCategory == 0) {
      filteredClasses = allClasses;
    } else {
      String selectedSubject = categories[selectedCategory];
      filteredClasses = allClasses
          .where((item) =>
              item.subject.toLowerCase() == selectedSubject.toLowerCase())
          .toList();
    }

    // 2. Ambil 4 item pertama untuk Recommendations
    final List<AllClass> recommendedData = filteredClasses.take(4).toList();

    // 3. Untuk PopularClasses: ambil 3 item berikutnya yang judulnya pendek
    // Misalnya, batas panjang judul adalah 30 karakter.
    const int maxTitleLength = 30;
    final List<AllClass> popularData = filteredClasses
        .skip(4)
        .where((item) => item.title.length <= maxTitleLength)
        .take(3)
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Pagi, Aleya👋',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Siap belajar hari ini?',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.calendar_today, color: Colors.grey),
          SizedBox(width: 10),
          Icon(Icons.notifications, color: Colors.grey),
          SizedBox(width: 10),
          Icon(Icons.person, color: Colors.grey),
          SizedBox(width: 16),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Kelas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Susun tampilan
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 20),
              const BannerWidget(),
              const SizedBox(height: 20),

              // RECOMMENDATIONS: 4 item (horizontal)
              Recommendations(
                categories: categories,
                selectedCategory: selectedCategory,
                onCategorySelected: (int index) {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                filteredClasses: recommendedData,
              ),

              const SizedBox(height: 20),

              // POPULAR CLASSES: 3 item dengan judul pendek (vertical)
              PopularClasses(popularData: popularData),
              const SizedBox(height: 20),
              const PopularBooks()
            ],
          ),
        ),
      ),
    );
  }
}