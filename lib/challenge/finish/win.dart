import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/challenge/challenge_screen.dart';
import 'package:swim_wave_117/core/con_bar.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';

class Win extends StatefulWidget {
  const Win({super.key});

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  int challengeInt = 0;
  int challengeWin = 0;
  @override
  void initState() {
    ssaasv();
    super.initState();
  }

  Future<void> ssaasv() async {
    int challengeIntawait = await getChallengeInt();
    int challengeWinawait = await getChallengeWin();
    setState(() {
      challengeInt = challengeIntawait;
      challengeWin = challengeWinawait;
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
              'assets/images/winn.png',
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
                Center(
                  child: Text(
                    'Win',
                    style: TextStyle(
                      color: SwColors.whate,
                      fontSize: 20.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                SwMotion(
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const SwBottomBar(
                          indexScr: 3,
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
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
                    challengeInt = challengeInt + 1;
                    challengeWin = challengeWin + 1;
                    await setChallengeInt(challengeInt);
                    await setChallengeWin(challengeWin);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 24.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: SwColors.blue1,
                    ),
                    child: Center(
                      child: Text(
                        'Accept the challenge',
                        style: TextStyle(
                          color: SwColors.whate,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
