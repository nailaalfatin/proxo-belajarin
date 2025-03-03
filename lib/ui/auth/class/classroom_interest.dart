import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/auth/major/major_screen.dart';
import 'package:flutter/material.dart';

class ClassroomInterest extends StatefulWidget {
  const ClassroomInterest({super.key});

  @override
  _ClassroomInterestState createState() => _ClassroomInterestState();
}

class _ClassroomInterestState extends State<ClassroomInterest> {
  List<String> minatList = [
    "Kelas 1",
    "Kelas 2",
    "Kelas 3",
    "Kelas 4",
    "Kelas 5",
    "Kelas 6",
    "Kelas 7",
    "Kelas 8",
    "Kelas 9",
    "Kelas 10",
    "Kelas 11",
    "Kelas 12",
    "Kelas 13",
    "Kelas 10 SMK",
    "Kelas 11 SMK",
    "Kelas 12 SMK",
    "Kelas 13 SMK",
  ];

  String? selectedMinat; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            margin: const EdgeInsets.only(left: 9),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pilih Kelas",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Pilih Kelas Anda",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft, // Pastikan kontennya rata kiri
                child: Wrap(
                  alignment:
                      WrapAlignment.start, // Elemen tetap mulai dari kiri
                  spacing: 10,
                  runSpacing: 15, // Kurangi runSpacing agar lebih kompak
                  children: minatList.map((minat) {
                    bool isSelected = selectedMinat == minat;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMinat = minat; // Hanya bisa pilih satu
                        });
                      },
                      child: Container(
                        constraints: const BoxConstraints(
                            minWidth: 80), // Pastikan ada lebar minimal
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color.fromARGB(255, 255, 214, 92)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          minat,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.black87,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MajorScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Selesai",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
