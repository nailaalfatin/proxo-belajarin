import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/auth/Login%20page%202/screen_auth.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton(Icons.apple, "Masuk dengan Apple"),
            const SizedBox(height: 12),
            _socialButtonWithImage("assets/images/Icon-google.png" , "Masuk dengan Google"),
            const SizedBox(height: 12),
            _socialButtonWithImage("assets/images/icon-facebook.png", "Masuk dengan Facebook"),
            const SizedBox(height: 40),
            _emailButton(context),
            const SizedBox(height: 16),
            _registerText()
          ],
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, String text) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        side: const BorderSide(color: Colors.grey, width: 0.7), 
        minimumSize: const Size(double.infinity, 50),
      ),
      icon: Icon(icon, color: Colors.black, size: 24),
      label: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _socialButtonWithImage(String imagePath, String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        side: const BorderSide(color: Colors.grey, width: 0.7),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 24), 
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ScreenAuth()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 14),
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      minimumSize: const Size(double.infinity, 50),
    ),
    child: const Text(
      "Masuk dengan Email",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}

  Widget _registerText() {
    return Text.rich(
      TextSpan(
        text: "Belum punya akun? ",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: "Daftar",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
