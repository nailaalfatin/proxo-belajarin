import 'package:belajarin_app/models/classes.dart';
import 'package:belajarin_app/ui/save-material/components/save_categories.dart';
import 'package:belajarin_app/ui/save-material/components/save_class_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belajarin_app/providers/save_provider.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  // Daftar kategori (sama dengan HomeScreen)
  final List<String> categories = [
    "Semua",
    "Matematika",
    "Fisika",
    "Kimia",
    "Biologi",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Ambil data savedItems dari provider
    final saveProvider = Provider.of<SaveProvider>(context);
    List<AllClass> savedItems = saveProvider.savedItems;

    // Lakukan filtering berdasarkan kategori yang terpilih
    List<AllClass> displayedClasses;
    if (selectedIndex == 0) {
      displayedClasses = savedItems;
    } else {
      String selectedSubject = categories[selectedIndex];
      displayedClasses = savedItems
          .where((item) =>
              item.subject.toLowerCase() == selectedSubject.toLowerCase())
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Disimpan",
          style: TextStyle(
            fontSize: 23,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            // Bar kategori (gunakan widget SaveCategories sesuai kode yang kamu berikan)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: SaveCategories(
                categories: categories,
                selectedIndex: selectedIndex,
                onCategorySelected: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            // Daftar item tersimpan (vertikal) berdasarkan filter kategori
            Expanded(
              child: displayedClasses.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      itemCount: displayedClasses.length,
                      itemBuilder: (context, index) {
                        return SaveClassCard(item: displayedClasses[index]);
                      },
                    )
                  : const Center(
                      child: Text(
                        "Belum ada materi yang disimpan",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
