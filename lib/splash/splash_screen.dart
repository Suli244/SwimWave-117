import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swim_wave_117/core/con_bar.dart';
import 'package:swim_wave_117/onboarding/onboarding_screen.dart';

class SpSc extends StatefulWidget {
  const SpSc({super.key});

  @override
  State<SpSc> createState() => _SpScState();
}

class _SpScState extends State<SpSc> {
  @override
  void initState() {
    firstOpen();
    super.initState();
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 260.w,
                height: 180.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  firstOpen() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingScreen(),
      ),
    );

    SharedPreferences.getInstance().then(
      (prefs) async {
        if (!prefs.containsKey('rrrkkksshhsfgdg')) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
            ),
          );
          prefs.setDouble('rrrkkksshhsfgdg', 23918476);
          await Future.delayed(const Duration(seconds: 3));
          try {
            final InAppReview inAppReview = InAppReview.instance;

            if (await inAppReview.isAvailable()) {
              inAppReview.requestReview();
            }
          } catch (e) {
            throw Exception(e);
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SwBottomBar(
                indexScr: 0,
              ),
            ),
          );
        }
      },
    );
  }
}
