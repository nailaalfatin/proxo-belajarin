import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/auth/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MajorScreen extends StatefulWidget {
  const MajorScreen({super.key});

  @override
  _MajorScreenState createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {
  final Map<String, List<String>> jurusanMap = {
    "SD": ["Kurikulum Merdeka", "Pembelajaran Tematik", "Pembelajaran Menurut Topik"],
    "SMP": ["Kurikulum Merdeka", "KTSP Revisi"],
    "SMA": ["Kurikulum Merdeka", "IPA - KTSP Revisi", "IPS - KTSP Revisi"],
    "SMK": [
      "Akuntansi dan Keuangan Lembaga",
      "Umum",
      "Multimedia",
      "Bisnis Daring dan Pemasaran",
      "Otomatisasi dan Tata Kelola Perkantoran"
    ]
  };

  String? selectedJurusan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            margin: const EdgeInsets.only(left: 8),
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
                "Pilih Jurusan",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: jurusanMap.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          runSpacing: 15,
                          children: entry.value.map((jurusan) {
                            String uniqueKey = "${entry.key} - $jurusan"; // Beda tiap kategori
                            bool isSelected = selectedJurusan == uniqueKey;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedJurusan = uniqueKey;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color.fromARGB(255, 255, 214, 92)
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  jurusan,
                                  style: TextStyle(
                                    color: isSelected ? Colors.black : Colors.black87,
                                    fontWeight:
                                        isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilScreen()),
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
                  "Lanjutkan",
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
