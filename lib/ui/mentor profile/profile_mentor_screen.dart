
import 'package:belajarin_app/ui/mentor%20profile/components/categories_mentor.dart';
import 'package:flutter/material.dart';

class ProfileMentorScreen extends StatefulWidget {
  const ProfileMentorScreen({super.key});

  @override
  State<ProfileMentorScreen> createState() => _ProfileMentorScreenState();
}

class _ProfileMentorScreenState extends State<ProfileMentorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Image.asset("assets/images/Icon-chat.png", width: 30)
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/ethan-yasir.png"),
              const SizedBox(height: 10),
              const Text(
                "Ethan Yasir",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Guru Matematika",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          children: [
                            Text("25",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20)),
                            Text("kursus",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 14)),
                          ],
                        ),
                        Container(height: 30, width: 1, color: Colors.grey),
                        const Column(
                          children: [
                            Text("8,1725",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20)),
                            Text("siswa",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 14)),
                          ],
                        ),
                        Container(height: 30, width: 1, color: Colors.grey),
                        const Column(
                          children: [
                            Text("725",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20)),
                            Text("ulasan",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5), 
                    const CategoriesMentor()
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}


