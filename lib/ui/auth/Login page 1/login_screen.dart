import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/auth/login%20page%201/components/submit_button.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            SizedBox(
              height: 140,
              child: Image.asset("assets/images/Auth.png"),
            ),
            const SizedBox(height: 40), 
            Text(
              "Belajarin",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, color: primaryColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
             const Text(
              "Mari jelajahi dunia pengetahuan bersama! \n Semoga sukses dengan studi Anda",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const SubmitButton()
          ],
        ),
      ),
    );
  }
}
