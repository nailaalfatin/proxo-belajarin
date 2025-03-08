import 'package:flutter/material.dart';

class SuggestedFriends extends StatelessWidget {
  const SuggestedFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset("assets/images/profile-notifikasi-1.png"),
            const SizedBox(width: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dari kontak anda",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 5),
              Text(
              "Jenny Winona",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black
              ),
            )
              ],
            ),
          
          ],
        ),
        SizedBox(height: 28),
        Row(
          children: [
            Image.asset("assets/images/profile-notifikasi-2.png"),
            const SizedBox(width: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dari kontak anda",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 5),
              Text(
              "Eleanor Melinda",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black
              ),
            )
              ],
            ),
          
          ],
        ),
        SizedBox(height: 28,),
        Row(
          children: [
            Image.asset("assets/images/profile-notifikasi-3.png"),
            const SizedBox(width: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dari kontak anda",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 5),
              Text(
              "Sanjuanita Elvira",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black
              ),
            )
              ],
            ),
          
          ],
        )
      ],
    );
  }
}