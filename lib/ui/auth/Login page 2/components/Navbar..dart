import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 50),
          _buildNavbar(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildNavbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _navItem("Masuk", true), // "Masuk" aktif
        const SizedBox(width: 100),
        _navItem("Daftar", false), // "Daftar" tidak aktif
      ],
    );
  }

  Widget _navItem(String text, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: isActive ? primaryColor : Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 100,
          height: 3,
          color: isActive ? primaryColor : Colors.transparent,
        ),
      ],
    );
  }
}
