import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0; 

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
        _navItem("Masuk", 0),
        const SizedBox(width: 100),
        _navItem("Daftar", 1),
      ],
    );
  }

  Widget _navItem(String text, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: selectedIndex == index ? primaryColor : Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 100,
              height: 3,
              color: selectedIndex == index ? primaryColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
