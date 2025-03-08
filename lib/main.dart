import 'package:belajarin_app/providers/save_provider.dart';
import 'package:belajarin_app/ui/home/home_screen.dart';
import 'package:belajarin_app/ui/inbox/inbox_screen.dart';
import 'package:belajarin_app/ui/mentor%20profile/Teacher_profile_screen.dart.dart';
import 'package:belajarin_app/ui/onboarding/splash_screen.dart';
import 'package:belajarin_app/ui/search%20page/serach_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SaveProvider(),
      child: const BelajarinApp(),
    ),
  );
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
        canvasColor: Colors.white, 
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily: 'Satoshi',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF757575)),
          bodySmall: TextStyle(color: Color(0xFF757575)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InboxScreen(),
      },
    );
  }
}
