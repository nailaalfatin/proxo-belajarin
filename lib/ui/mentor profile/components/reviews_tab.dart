import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage("assets/images/user1.png")),
          title: Text("Beatrisa Jasmin"),
          subtitle: Text("Kursus sangat bagus, penjelasannya jelas dan mudah dimengerti! 😍😍"),
          trailing: Icon(Icons.favorite),
        ),
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage("assets/images/user2.png")),
          title: Text("Nuan Bao-yu"),
          subtitle: Text("Luar biasa! Inilah yang saya cari, saya rekomendasikan kepada semua orang! 😊"),
          trailing: Icon(Icons.favorite),
        ),
      ],
    );
  }
}
