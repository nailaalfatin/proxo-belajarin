import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/schedule/components/schedule_card.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int selectedDayIndex = 3; // Index hari yang dipilih (default ke hari Rabu)

  // Data jadwal berdasarkan hari
  final Map<int, List<Map<String, String>>> scheduleData = {
    0: [],
    1: [],
    2: [],
    3: [
      {
        "time": "11:35",
        "title": "Fungsi, Persamaan dan Pertidaksamaan Rasional",
        "subtitle": "Bagian 2: Fungsi Rasional",
        "kelas": "Kelas 11 - B11",
        "teacher": "Hendrawan",
      },
    ],
    4: [],
    5: [],
    6: [],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Jadwal",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("20",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rabu", style: TextStyle(color: Colors.grey)),
                            Text("Jan2024",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("Hari Ini",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                List<String> days = ["M", "S", "S", "R", "K", "J", "S"];
                bool isSelected = selectedDayIndex == index;

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedDayIndex = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.amber : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            days[index],
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            (17 + index).toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const Divider(
              color: Colors.grey, 
              thickness: 0.2, 
              height: 22,
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text("Waktu",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                Text("Kursus",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.menu, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: scheduleData[selectedDayIndex]!.isNotEmpty
                  ? Column(
                      children: [
                        ScheduleCard(
                          time: scheduleData[selectedDayIndex]![0]["time"]!,
                          title: scheduleData[selectedDayIndex]![0]["title"]!,
                          subtitle: scheduleData[selectedDayIndex]![0]
                              ["subtitle"]!,
                          kelas: scheduleData[selectedDayIndex]![0]["kelas"]!,
                          teacher: scheduleData[selectedDayIndex]![0]
                              ["teacher"]!,
                        ),
                      ],
                    )
                  : const Center(
                      child: Text("Tidak ada jadwal",
                          style: TextStyle(color: Colors.grey)),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
