import 'package:belajarin_app/models/classes.dart';
import 'package:belajarin_app/ui/home/components/banner.dart';
import 'package:belajarin_app/ui/home/components/popular_books.dart';
import 'package:belajarin_app/ui/home/components/popular_classes.dart';
import 'package:belajarin_app/ui/home/components/recommendations.dart';
import 'package:belajarin_app/ui/home/components/search_bar.dart';
<<<<<<< HEAD
import 'package:belajarin_app/ui/notifikasi/notification_screen.dart';
import 'package:belajarin_app/ui/save%20material/save_screen.dart';
import 'package:belajarin_app/ui/schedule/schedule_screen.dart';
=======
import 'package:belajarin_app/ui/save-material/save_screen.dart';
>>>>>>> db62044dc4473bb97f40b9e7fd59086cc77c753c
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  final List<String> categories = [
    "Semua",
    "Matematika",
    "Fisika",
    "Kimia",
    "Biologi",
  ];

  @override
  Widget build(BuildContext context) {
    // Filter data sesuai kategori
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

    // Ambil 4 item pertama untuk Recommendations (misalnya)
    final List<AllClass> recommendedData = filteredClasses.take(4).toList();

    // Untuk PopularClasses: ambil 3 item berikutnya (contoh)
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
              'Selamat Pagi, Aleya 👋🏻',
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
        actions: [
<<<<<<< HEAD
         IconButton(
            icon:
                const Icon(Icons.calendar_today, color: Colors.grey),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ScheduleScreen()));
            },
          ),
          IconButton(
            icon:
                const Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()));
            },
          ),
          IconButton(
            icon:
                const Icon(Icons.bookmark_border_outlined, color: Colors.grey),
            onPressed: () {
              Navigator.push(context,
=======
          const Icon(Icons.calendar_today, color: Colors.black),
          const SizedBox(width: 10),
          const Icon(Icons.notifications, color: Colors.black),
          IconButton(
            icon: const Icon(Icons.bookmark_border_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
>>>>>>> db62044dc4473bb97f40b9e7fd59086cc77c753c
                  MaterialPageRoute(builder: (context) => const SaveScreen()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Kelas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
<<<<<<< HEAD
      body: Container(
        color: Colors.white, 
        child: SingleChildScrollView(
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
=======
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 20),
              const BannerWidget(),
              const SizedBox(height: 20),
              // RECOMMENDATIONS menggunakan Categories widget
              Recommendations(
                categories: categories,
                selectedCategory: selectedCategory,
                onCategorySelected: (int index) {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                allClasses: recommendedData,
              ),
              const SizedBox(height: 20),
              PopularClasses(popularData: popularData),
              const SizedBox(height: 20),
              const PopularBooks(),
            ],
>>>>>>> db62044dc4473bb97f40b9e7fd59086cc77c753c
          ),
        ),
      ),
    );
  }
}
