import 'dart:async';
import 'package:belajarin_app/ui/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _bgController;
  late Animation<Color?> _bgAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animasi fade-in logo
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Animasi background color change
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _bgAnimation = ColorTween(
      begin: Colors.white,
      end: const Color(0xFFEFF2FF),
    ).animate(_bgController);

    // Mulai animasi sequence
    _startSplashSequence();
  }

  void _startSplashSequence() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Sedikit delay buat efek smooth
    _fadeController.forward(); // Fade in logo
    await Future.delayed(const Duration(seconds: 1));
    _bgController.forward(); // Ganti background ke #EEF2FF
    await Future.delayed(const Duration(seconds: 1));
    _bgController.reverse(); // Kembali ke putih
    await Future.delayed(const Duration(seconds: 1));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()), // Ganti ke halaman utama
    );
  }

  @override
  void dispose() {
    _bgController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bgAnimation,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _bgAnimation.value,
          body: Center(
            child: FadeTransition(
              opacity: _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
              ),
              child: Image.asset(
                'assets/logos/belajarin-logo.png',
                width: 160,
                height: 160,
                alignment: Alignment.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
