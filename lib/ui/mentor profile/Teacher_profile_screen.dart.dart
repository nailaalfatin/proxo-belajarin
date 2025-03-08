import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/mentor%20profile/components/categories.dart';
import 'package:belajarin_app/ui/mentor%20profile/components/course_card.dart';
import 'package:belajarin_app/ui/mentor%20profile/components/students_card.dart';
import 'package:belajarin_app/ui/mentor%20profile/components/review_card.dart';
import 'package:flutter/material.dart';

class TeacherProfileScreen extends StatefulWidget {
  const TeacherProfileScreen({super.key});

  @override
  State<TeacherProfileScreen> createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Container(
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
             Image.asset("assets/images/chat.png", height: 24),
           ],
            
        ),
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/ethan-yasir.png'),
          ),
          const SizedBox(height: 10),
          const Text("Ethan Yasir",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const Text("Guru Matematika",
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 25),
          StatisticsWidget(),
          const SizedBox(height: 20),
          TabBar(
            controller: _tabController,
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: "Kursus"),
              Tab(text: "Murid"),
              Tab(text: "Ulasan"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCourseList(),
                _buildStudentList(),
                _buildReviewList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseList() {
    List<Map<String, String>> courses = [
      {
        "image": "assets/images/matematika-persamaan.png",
        "title": "Matematika",
        "desc": "Fungsi, Persamaan, dan Pertidaksamaan Rasional",
        "star": "⭐ 4.9"
      },
      {
        "image": "assets/images/logika-matematika.png",
        "title": "Matematika",
        "desc": "Pemecahan masalah dengan aljabar",
        "star": "⭐ 4.9"
      },
    ];

    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return CourseCard(
          imagePath: courses[index]["image"]!,
          title: courses[index]["title"]!,
          desc: courses[index]["desc"]!,
          star: courses[index]["star"]!,
        );
      },
    );
  }

  Widget _buildStudentList() {
    List<Map<String, String>> students = [
      {
        "image": "assets/images/beatrisa.png",
        "name": "Beatrisa Jasmin",
        "status": "Siswi"
      },
      {
        "image": "assets/images/gabriel.png",
        "name": "Gabriel William",
        "status": "Siswa"
      },
      {
        "image": "assets/images/tushar.png",
        "name": "Tushar Aditya",
        "status": "Siswa"
      },
      {
        "image": "assets/images/neona.png",
        "name": "Neona Anindita",
        "status": "Lulus"
      },
      {
        "image": "assets/images/nuan-bao-yu.png",
        "name": "Nuan Bao-yu",
        "status": "Aktif"
      },
    ];

    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return StudentCard(
          imagePath: students[index]["image"]!,
          name: students[index]["name"]!,
          status: students[index]["status"]!,
        );
      },
    );
  }

  Widget _buildReviewList() {
    List<Map<String, String>> reviews = [
      {
        "image": "assets/images/beatrisa.png",
        "name": "Beatrisa Jasmin",
        "comment":
            "Kursusnya sangat bagus, penjelasan dari mentornya sangat jelas dan mudah dimengerti!😎😎",
        "likes": "369",
        "time": "2 Minggu lalu"
      },
      {
        "image": "assets/images/nuan-bao-yu.png",
        "name": "Nuan Bao-yu",
        "comment":
            "Luar biasa! Inilah yang saya cari, saya rekomendasikan kepada semua orang 😁😁😁😁",
        "likes": "228",
        "time": "3 Minggu lalu"
      },
      {
        "image": "assets/images/Aiden.png",
        "name": "Gabriel William",
        "comment":
            "Cara mengajarnya simpel dan mudah dipahami, sangat membantu!👌👌👌",
        "likes": "154",
        "time": "1 Bulan lalu"
      },
      {
        "image": "assets/images/tushar.png",
        "name": "Tushar Aditya",
        "comment":
            "Dengan mentor ini, materi yang sulit jadi mudah dipahami, dan bagian yang bingung bisa diterangkan!🤩🤩",
        "likes": "307",
        "time": "1 Minggu lalu"
      },
    ];

    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return ReviewCard(
          imagePath: reviews[index]["image"]!,
          name: reviews[index]["name"]!,
          comment: reviews[index]["comment"]!,
          likes: reviews[index]["likes"]!,
          time: reviews[index]["time"]!,
        );
      },
    );
  }
}
