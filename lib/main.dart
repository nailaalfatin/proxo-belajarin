import 'package:belajarin_app/ui/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const BelajarinApp());
}

class BelajarinApp extends StatelessWidget {
  const BelajarinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajarin',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Satoshi',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF757575)),
          bodySmall: TextStyle(color: Color(0xFF757575)),
        ),
      ),
      initialRoute: '/', // SplashScreen sebagai halaman pertama
      routes: {
        '/': (context) => const SplashScreen(),
      },
    );
  }
}
