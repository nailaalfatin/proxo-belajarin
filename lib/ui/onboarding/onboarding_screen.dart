import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/auth/Login%20page%201/components/submit_button.dart';
import 'package:belajarin_app/ui/auth/Login%20page%201/login_screen.dart';
import 'package:belajarin_app/ui/auth/Login%20page%202/screen_auth.dart';
import 'package:belajarin_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Bagian tengah menampung PageView
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = (index == 3));
                },
                children: [
                  OnboardingPage(
                    controller: _controller,
                    image: 'assets/images/on-boarding-1.png',
                    title: 'Belajar di mana saja dan kapan saja',
                    subtitle:
                        'Dunia adalah kelasmu, pelajari apa pun, di mana pun, kapan pun.',
                  ),
                  OnboardingPage(
                    controller: _controller,
                    image: 'assets/images/on-boarding-2.png',
                    title: 'Video dengan kualitas terbaik dalam mengajar',
                    subtitle:
                        'Akses pengetahuan tanpa henti, kapan dan di mana pun kamu mau.',
                  ),
                  OnboardingPage(
                    controller: _controller,
                    image: 'assets/images/on-boarding-3.png',
                    title: 'Akhiri keraguan, Mulai Perjalanan',
                    subtitle:
                        'Ragu hanya menunda pencapaian, mari mulai perjalananmu sekarang bersama Belajarin.',
                  ),
                  // Halaman terakhir
                  OnboardingPage(
                    controller: _controller,
                    image: 'assets/images/on-boarding-3.png',
                    title: 'Akhiri keraguan, Mulai Perjalanan',
                    subtitle:
                        'Ragu hanya menunda pencapaian, mari mulai perjalananmu sekarang bersama Belajarin.',
                    isLast: true,
                  ),
                ],
              ),
            ),

            // Bagian bawah: Tombol di kiri & kanan
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20, 
                horizontal: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol Kiri: "Lewati" atau "Kembali"
                  isLastPage
                      ? TextButton(
                          onPressed: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text(
                            'Kembali',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : TextButton(
                          onPressed: () => _controller.jumpToPage(3),
                          child: const Text(
                            'Lewati',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),

                  // Tombol Kanan: Next (ikon panah) atau "Memulai"
                  isLastPage
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenLogin(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            'Memulai',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final PageController controller;
  final String image;
  final String title;
  final String subtitle;
  final bool isLast;

  const OnboardingPage({
    super.key,
    required this.controller,
    required this.image,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo di bagian paling atas
        const SizedBox(height: 20),
        Image.asset(
          'assets/logos/belajarin-logo.png',
          width: 90,
          height: 90,
          alignment: Alignment.center,
        ),
        // Expanded agar konten utama (gambar, indicator, teks) berada di tengah,
        // lalu kita geser sedikit ke atas dengan Align
        Expanded(
          child: Align(
            alignment: const Alignment(0, -0.3), // geser konten ke atas sedikit
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Gambar konten utama
                Image.asset(image, height: 250),
                const SizedBox(height: 40),
                // Indicator (di atas teks)
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    activeDotColor: primaryColor,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                const SizedBox(height: 40),
                // Judul
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Subjudul
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
