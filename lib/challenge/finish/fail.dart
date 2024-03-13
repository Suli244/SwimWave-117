import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/challenge/challenge_screen.dart';
import 'package:swim_wave_117/challenge/content/challenge_content.dart';
import 'package:swim_wave_117/core/con_bar.dart';

import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';

class Fail extends StatefulWidget {
  const Fail({super.key});

  @override
  State<Fail> createState() => _FailState();
}

class _FailState extends State<Fail> {
  int challengeFail = 0;
  @override
  void initState() {
    ssaasv();
    super.initState();
  }

  Future<void> ssaasv() async {
    int challengeFailawait = await getChallengeFail();
    setState(() {
      challengeFail = challengeFailawait;
    });
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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SwMotion(
                      onPressed: () async {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const SwBottomBar(
                              indexScr: 3,
                            ),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(-1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                  position: offsetAnimation, child: child);
                            },
                          ),
                          (route) => false,
                        );
                        challengeFail = challengeFail + 1;
                        await setChallengeFail(challengeFail);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20.r,
                        color: SwColors.blue1,
                      ),
                    ),
                    Text(
                      'Fail',
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 20.r)
                  ],
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        Text(
                          listYoCh[0].title,
                          style: TextStyle(
                            color: SwColors.whate,
                            fontSize: 24.h,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          '''I understand that tackling a challenge can sometimes be difficult. But remember that it's just a temporary obstacle on the way to your goals, not the end of the road. Life is full of challenges, and each one is an opportunity to grow and become stronger.

Failure is not a defeat, but a lesson. Figure out what didn't work and use that knowledge for your future success. It's important to realize that success isn't measured only by the number of push-ups done or reaching a specific goal. It is a process that takes time, patience, and constant effort.

Allow yourself to rest if necessary, but don't forget to recommit to your goals. Remember that even the greatest athletes face setbacks, but it is they who rise up after every stroke of fate that become the real winners.

You can do it! It's important to keep moving forward, even if the steps seem tiny. Failures are part of the road to success, not the end point. Believe in yourself, learn from your mistakes, and keep moving forward. Be persistent, and you will definitely achieve your goals!''',
                          style: TextStyle(
                            color: SwColors.whate,
                            fontSize: 16.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
