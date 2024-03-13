import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swim_wave_117/challenge/content/challenge_content.dart';
import 'package:swim_wave_117/challenge/finish/fail.dart';
import 'package:swim_wave_117/challenge/finish/win.dart';

import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class StartYourChallengeSreen extends StatefulWidget {
  const StartYourChallengeSreen({super.key, required this.model});
  final YoCh model;
  @override
  State<StartYourChallengeSreen> createState() =>
      _StartYourChallengeSreenState();
}

class _StartYourChallengeSreenState extends State<StartYourChallengeSreen>
    with WidgetsBindingObserver {
  late Timer _timer;
  int secondsButton = 00;
  CountdownController timeController = CountdownController(autoStart: true);

  @override
  void initState() {
    super.initState();
    sssss();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      tttimeUpdates();
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer.cancel();
    super.dispose();
  }

  bool timerHasFinished = false;
  tttimeUpdates() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('tttimeUpdatesa')) {
      final lastUpdateDateTime =
          DateTime.parse(prefs.getString('tttimeUpdatesa')!);
      final difference = DateTime.now().difference(lastUpdateDateTime);

      if (difference.inMinutes < widget.model.min) {
        setState(() {
          secondsButton = (widget.model.min * 60) - difference.inSeconds;
          timerHasFinished = false;
        });
      } else if (!timerHasFinished) {
        _showDialog();
        timerHasFinished = true;
        setState(() {
          secondsButton = 0;
        });
      }
      // if (difference.inMinutes < 5) {
      //   setState(() {
      //     secondsButton = 300 - difference.inSeconds;
      //   });
      // } else {
      //   if (len < listNews.length) {
      //     len = len + 1;
      //     setLengNews(len);
      //     final prefs = await SharedPreferences.getInstance();
      //     prefs.setString('UpdateTime', DateTime.now().toString());
      //     updateTime();
      //   }
      //   setState(() {
      //     secondsButton = 0;
      //   });
      // }
    } else {
      setState(() {
        secondsButton = 0;
      });
    }
  }

  Future<void> sssss() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tttimeUpdatesa', DateTime.now().toString());
    tttimeUpdates();
  }

  String getFirstDigitOfMinutes(int seconds) {
    int minutes = (seconds / 60).floor();
    String minutesString = minutes.toString().padLeft(2, '0');
    return minutesString.substring(0, 1);
  }

  String getLastDigitOfMinutes(int seconds) {
    int minutes = (seconds / 60).floor();
    String minutesString = minutes.toString();
    return minutesString.substring(minutesString.length - 1);
  }

  String getFirstDigitOfSeconds(int seconds) {
    int sec = seconds % 60;
    String secondsString = sec.toString().padLeft(2, '0');
    return secondsString.substring(0, 1);
  }

  String getLastDigitOfSeconds(int seconds) {
    int sec = seconds % 60;
    String secondsString = sec.toString().padLeft(2, '0');
    return secondsString.substring(secondsString.length - 1);
  }

  // String minutesConvert(int seconds) {
  //   Duration clockTimer = Duration(seconds: seconds);
  //   return '${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  // }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('How\'s it going?'),
          content: const Text('Did you get through the challenge?'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                'No',
                style: TextStyle(
                  color: SwColors.blue007AFF,
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Fail(),
                  ),
                  (protected) => false,
                );
              },
            ),
            CupertinoDialogAction(
              child: Text(
                'Yes',
                style: TextStyle(
                  color: SwColors.blue007AFF,
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Win(),
                  ),
                  (protected) => false,
                );
              },
            ),
          ],
        );
      },
    );
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
                Center(
                  child: Text(
                    'Your challenge',
                    style: TextStyle(
                      color: SwColors.whate,
                      fontSize: 20.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 28.h),
                Text(
                  widget.model.title,
                  style: TextStyle(
                    color: SwColors.whate,
                    fontSize: 24.h,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: TttWidg(
                        child: Center(
                            child: Countdown(
                          controller: timeController,
                          seconds: secondsButton,
                          build: (ctx, value) {
                            return Text(
                              getFirstDigitOfMinutes(secondsButton),
                              style: TextStyle(
                                color: SwColors.whate,
                                fontSize: 40.h,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        )),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TttWidg(
                        child: Center(
                            child: Countdown(
                          controller: timeController,
                          seconds: secondsButton,
                          build: (ctx, value) {
                            return Text(
                              getLastDigitOfMinutes(secondsButton),
                              style: TextStyle(
                                color: SwColors.whate,
                                fontSize: 40.h,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        )),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      ':',
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 40.h,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: TttWidg(
                        child: Center(
                            child: Countdown(
                          controller: timeController,
                          seconds: secondsButton,
                          build: (ctx, value) {
                            return Text(
                              getFirstDigitOfSeconds(secondsButton),
                              style: TextStyle(
                                color: SwColors.whate,
                                fontSize: 40.h,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        )),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TttWidg(
                        child: Center(
                            child: Countdown(
                          controller: timeController,
                          seconds: secondsButton,
                          build: (ctx, value) {
                            return Text(
                              getLastDigitOfSeconds(secondsButton),
                              style: TextStyle(
                                color: SwColors.whate,
                                fontSize: 40.h,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        )),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SwMotion(
                  onPressed: () {
                    _showDialog();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: SwColors.blue2.withOpacity(0.5),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
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

class TttWidg extends StatelessWidget {
  const TttWidg({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 24.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: SwColors.blue3,
        ),
        child: child);
  }
}
