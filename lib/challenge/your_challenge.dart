import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/challenge/content/challenge_content.dart';
import 'package:swim_wave_117/challenge/start_your_challenge.dart';

import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';

class YourChallengeSreen extends StatefulWidget {
  const YourChallengeSreen({super.key});

  @override
  State<YourChallengeSreen> createState() => _YourChallengeSreenState();
}

class _YourChallengeSreenState extends State<YourChallengeSreen> {
  // @override
  // void initState() {
  //   listYoCh.shuffle();
  //   super.initState();
  // }

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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SwMotion(
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //       child: Icon(
                //         Icons.arrow_back_ios_rounded,
                //         size: 20.r,
                //         color: SwColors.whate,
                //       ),
                //     ),
                //     Text(
                //       'Your challenge',
                //       style: TextStyle(
                //         color: SwColors.whate,
                //         fontSize: 20.h,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //     SizedBox(width: 20.r)
                //   ],
                // ),
                SizedBox(height: 28.h),
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
                  listYoCh[0].subTitle,
                  style: TextStyle(
                    color: SwColors.whate,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Time: ${listYoCh[0].min}min"',
                  style: TextStyle(
                    color: SwColors.whate,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                SwMotion(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartYourChallengeSreen(
                          model: listYoCh[0],
                        ),
                      ),
                      (protected) => false,
                    );
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
                SizedBox(height: 12.h),
                SwMotion(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text(
                              'Are you sure you want to cancel the challenge?'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text(
                                'No',
                                style: TextStyle(
                                  color: SwColors.blue007AFF,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
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
                                Navigator.of(context).pop();
                                setState(() {
                                  listYoCh.shuffle();
                                });
                              },
                            ),
                          ],
                        );
                      },
                    );
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
