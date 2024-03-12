import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swim_wave_117/challenge/your_challenge.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/settings/settings_screen.dart';

class ChallengeSreen extends StatefulWidget {
  const ChallengeSreen({super.key});

  @override
  State<ChallengeSreen> createState() => _ChallengeSreenState();
}

class _ChallengeSreenState extends State<ChallengeSreen> {
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
              children: [
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 24.w),
                    Text(
                      'Challenge',
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SwMotion(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsSreen(),
                            ));
                      },
                      child: Image.asset(
                        'assets/icons/icon_setting.png',
                        width: 24.w,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 28.h),
                Container(
                  padding: EdgeInsets.all(24.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: SwColors.blue3,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              FutureBuilder(
                                  future: getChallengeInt(),
                                  builder: (context, snapshot) {
                                    int getChallengeInt = snapshot.data ?? 0;
                                    return Text(
                                      '$getChallengeInt',
                                      style: TextStyle(
                                        color: SwColors.whate,
                                        fontSize: 40.h,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    );
                                  }),
                              SizedBox(width: 4.w),
                              Text(
                                'exp',
                                style: TextStyle(
                                  color: SwColors.whate,
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SwMotion(
                              onPressed: () {},
                              child: Image.asset('assets/images/share.png',
                                  width: 24.w)),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Challenges completed: 0',
                        style: TextStyle(
                          color: SwColors.whate,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Failed Challenges: 0',
                        style: TextStyle(
                          color: SwColors.whate,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SwMotion(
                  onPressed: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const YourChallengeSreen(),
                      ),
                      (protected) => false,
                    );
                    setState(() {});
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

Future<int> getChallengeInt() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('ChallengeInt') ?? 0;
}

Future<void> setChallengeInt(int challengeInt) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('ChallengeInt', challengeInt);
}
