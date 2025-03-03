import 'package:belajarin_app/ui/auth/Login%20page%202/components/Navbar..dart';
import 'package:belajarin_app/ui/auth/Login%20page%202/components/form.dart';
import 'package:flutter/material.dart';


class ScreenAuth extends StatefulWidget {
  const ScreenAuth({super.key});

  @override
  State<ScreenAuth> createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Navbar(), 
              const SizedBox(height: 30), 
              AuthForm(), 
            ],
          ),
        ),
      ),
    );
  }
}
