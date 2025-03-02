import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/detail/components/about-tab/about_tab.dart';
import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/lessons_tab.dart';
import 'package:belajarin_app/ui/detail/components/reviews-tab/reviews_tab.dart';
import 'package:flutter/material.dart';
import 'package:belajarin_app/models/classes.dart';

class DetailScreen extends StatefulWidget {
  final AllClass item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

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
    final AllClass item = widget.item;

    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageSection(item),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBadgeAndRating(item),
                    const SizedBox(height: 8),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const InfoRow(),
                    const SizedBox(height: 16),
                    _buildTabBar(),
                  ],
                ),
              ),
              SizedBox(
                height: 600, // Atur sesuai konten atau device
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    AboutTab(),
                    LessonsTab(),
                    ReviewsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              elevation: 0,
            ),
            onPressed: () {},
            child: const Text(
              "Mulai Sekarang",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(AllClass item) {
    return Stack(
      children: [
        // Gambar latar
        Image.asset(
          item.imageUrl,
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        ),
        
        // Tombol kembali di pojok kiri atas
        Positioned(
          top: 8,
          left: 8,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // Tombol "Pratinjau Kelas" di tengah gambar
        Positioned.fill(
          child: Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 24,
              ),
              label: const Text(
                "Pratinjau Kelas",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.4),
                shape: const StadiumBorder(), // Membuat sudut oval/pill
                elevation: 0, // Hilangkan shadow
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBadgeAndRating(AllClass item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.yellow.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "Terbaik",
            style: TextStyle(
              color: Color(0xFFFFBB39),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            Text(
              "${item.rating} (732 ulasan)",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: primaryColor,
      unselectedLabelColor: Colors.grey,
      indicatorColor: primaryColor,
      tabs: const [
        Tab(text: "Tentang"),
        Tab(text: "Pelajaran"),
        Tab(text: "Ulasan"),
      ],
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              size: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 7),
          Text(
            "Ethan Yasir",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 15),
          Icon(
            Icons.people,
            size: 20,
            color: Colors.grey,
          ),
          SizedBox(width: 7),
          Text(
            "872 Siswa",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 15),
          Icon(
            Icons.menu_book,
            size: 20,
            color: Colors.grey,
          ),
          SizedBox(width: 5),
          Text(
            "25 Pelajaran",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 15),
          Icon(
            Icons.card_membership_outlined,
            size: 20,
            color: Colors.grey,
          ),
          SizedBox(width: 5),
          Text(
            "Sertifikat",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
