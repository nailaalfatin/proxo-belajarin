import 'package:belajarin_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => isLastPage = index == 3);
              },
              children: const [
                OnboardingPage(
                  image: 'assets/images/on-boarding-1.png',
                  title: 'Belajar di mana saja dan kapan saja',
                  subtitle: 'Dunia adalah kelasmu, belajar kapan pun, di mana pun.',
                ),
                OnboardingPage(
                  image: 'assets/images/on-boarding-2.png',
                  title: 'Video dengan kualitas terbaik dalam mengajar',
                  subtitle: 'Akses pengetahuan tanpa henti, kapan dan di mana pun kamu mau.',
                ),
                OnboardingPage(
                  image: 'assets/images/on-boarding-3.png',
                  title: 'Akhiri keraguan, Mulai Perjalanan',
                  subtitle: 'Ragu hanya menunda pencapaian, mari mulai perjalananmu sekarang bersama Studyway.',
                ),
                OnboardingPage(
                  image: 'assets/images/on-boarding-3.png',
                  title: 'Akhiri keraguan, Mulai Perjalanan',
                  subtitle: 'Ragu hanya menunda pencapaian, mari mulai perjalananmu sekarang bersama Studyway.',
                  isLast: true,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => _controller.jumpToPage(3),
                      child: const Text('Lewati', style: TextStyle(fontSize: 16)),
                    ),
                    isLastPage
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const HomeScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            ),
                             child: const Text('Mulai'),
                          )
                        : IconButton(
                            onPressed: () => _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            ),
                            icon: const Icon(Icons.arrow_forward, size: 30),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool isLast;

  const OnboardingPage({super.key, 
    required this.image,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
