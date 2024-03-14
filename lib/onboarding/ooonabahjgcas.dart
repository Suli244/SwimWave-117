import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/onboarding/btn_mod_wid.dart';
import 'package:swim_wave_117/onboarding/item_onboa.dart';
import 'package:swim_wave_117/premium/preeeeemcaslkna.dart';

class Ooonabahjgcas extends StatefulWidget {
  const Ooonabahjgcas({super.key});
  @override
  State<Ooonabahjgcas> createState() => _OoonabahjgcasState();
}

class _OoonabahjgcasState extends State<Ooonabahjgcas> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/brImage.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.76,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      currantPage = value;
                    });
                  },
                  children: const [
                    OnBoarItem(
                      imag: 'assets/images/onbarOne.png',
                      tit: 'Techniques and tips',
                      dec:
                          'Discover the best techniques and useful tips to improve your skills. Improve your techniques with our experts and reach new heights.',
                    ),
                    OnBoarItem(
                      imag: 'assets/images/onbarTwo.png',
                      tit: 'Safety',
                      dec:
                          'The importance of your well-being is paramount. In the "Safety" section you will find tips and advice to help you look after yourself and others during training.',
                    ),
                    OnBoarItem(
                      imag: 'assets/images/onbarThree.png',
                      tit: 'Fitness',
                      dec:
                          'Immerse yourself in the world of health and fitness with our Fitness section. Here you will find instructions, workouts and motivation to reach your goals.',
                    ),
                    OnBoarItem(
                      imag: 'assets/images/onbarFour.png',
                      tit: 'Challenge',
                      dec:
                          'Take the challenge and raise the bar on your achievements. In the Challenge section, you\'ll find fun challenges that will help you overcome yourself and keep you motivated.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: BtnModWidget(
                  onPressed: () {
                    if (currantPage == 3) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Preeeeemcaslkna(),
                        ),
                        (protected) => false,
                      );
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  text: 'NEXT',
                ),
              ),
              const SizedBox(height: 18),
              SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: ScrollingDotsEffect(
                  activeDotColor: SwColors.whate,
                  dotColor: SwColors.blue2,
                  dotHeight: 6,
                  dotWidth: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
