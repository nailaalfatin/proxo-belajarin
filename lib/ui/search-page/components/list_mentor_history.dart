import 'package:flutter/material.dart';

class ListMentor extends StatelessWidget {
  final List<Map<String, String>> mentors = [
    {"name": "Fini Charisa", "image": "assets/images/fini-charisa.png"},
    {"name": "Kevin S.", "image": "assets/images/kevinS.png"},
    {"name": "Aliena Cai", "image": "assets/images/AlienaCai.png"},
    {"name": "Yok Bomb", "image": "assets/images/YokoBomb.png"},
    {"name": "Dea Afrizal", "image": "assets/images/DeaAfrizal.png"},
    {"name": "Rachel How", "image": "assets/images/RachelHow.png"},
    {"name": "Lily C", "image": "assets/images/Lily-C.png"},
    {"name": "Galang S.", "image": "assets/images/Galang-S..png"},
    {"name": "Syhntia.", "image": "assets/images/Synthia.png"},
  ];

  ListMentor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Mentor Terbaik",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Lihat Semua",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: mentors.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(mentors[index]["image"]!),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    mentors[index]["name"]!,
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
