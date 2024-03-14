// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/core/swimwave_psascovas.dart';
import 'package:swim_wave_117/premium/premium_screen.dart';
import 'package:swim_wave_117/settings/settings_screen.dart';
import 'package:swim_wave_117/techniques/content/techniques_content.dart';
import 'package:swim_wave_117/techniques/content/tips_content.dart';
import 'package:swim_wave_117/techniques/detail_techniques_sreen.dart';
import 'package:swim_wave_117/techniques/detail_tips_sreen.dart';

class TechniquesSreen extends StatefulWidget {
  const TechniquesSreen({super.key});

  @override
  State<TechniquesSreen> createState() => _TechniquesSreenState();
}

class _TechniquesSreenState extends State<TechniquesSreen> {
  String text = 'Techniques';
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
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 24.w),
                    Text(
                      'Study',
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
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.r),
                      border:
                          Border.all(color: SwColors.blue2.withOpacity(0.5))),
                  child: Row(
                    children: [
                      Expanded(
                        child: SwMotion(
                          onPressed: () {
                            setState(() {
                              text = 'Techniques';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.r),
                              color: text == 'Techniques'
                                  ? SwColors.blue1
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                'Techniques',
                                style: TextStyle(
                                  color: text == 'Techniques'
                                      ? SwColors.whate
                                      : SwColors.blue2.withOpacity(0.5),
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SwMotion(
                          onPressed: () {
                            setState(() {
                              text = 'Tips';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.r),
                              color: text == 'Tips'
                                  ? SwColors.blue1
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                'Tips',
                                style: TextStyle(
                                  color: text == 'Tips'
                                      ? SwColors.whate
                                      : SwColors.blue2.withOpacity(0.5),
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                FutureBuilder(
                  future: getSwimwavePichajs(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && !snapshot.data!) {
                      return SwMotion(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PremiumScreen(
                                isClose: true,
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/premiumOnPre.png',
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        text == 'Techniques'
                            ? FutureBuilder(
                                future: getSwimwavePichajs(),
                                builder: (context, snapshot) {
                                  return ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return SwMotion(
                                        onPressed: () {
                                          if (snapshot.hasData &&
                                              !snapshot.data!) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PremiumScreen(
                                                  isClose: true,
                                                ),
                                              ),
                                            );
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailTechniquesSreen(
                                                  model: listTechCon[index],
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 168.h,
                                          padding: EdgeInsets.all(16.r),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  listTechCon[index].image),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listTechCon[index].title,
                                                style: TextStyle(
                                                  color: SwColors.whate,
                                                  fontSize: 24.h,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 4.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'FREE',
                                                    style: TextStyle(
                                                      color: SwColors.blue1,
                                                      fontSize: 12.h,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(width: 8.w),
                                                  Text(
                                                    'Techniques',
                                                    style: TextStyle(
                                                      color: SwColors.whate,
                                                      fontSize: 12.h,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (_, i) =>
                                        SizedBox(height: 12.h),
                                    itemCount: listTechCon.length,
                                  );
                                })
                            : FutureBuilder(
                                future: getSwimwavePichajs(),
                                builder: (context, snapshot) {
                                  return ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return SwMotion(
                                        onPressed: () {
                                          if (snapshot.hasData &&
                                              !snapshot.data!) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PremiumScreen(
                                                  isClose: true,
                                                ),
                                              ),
                                            );
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailTipsSreen(
                                                  model: listTipsCon[index],
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 96.h,
                                          decoration: BoxDecoration(
                                            color: SwColors.blue084685,
                                            borderRadius:
                                                BorderRadius.circular(19.r),
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                listTipsCon[index].image,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: 120.w,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(width: 16.w),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listTipsCon[index].title,
                                                      style: TextStyle(
                                                        color: SwColors.whate,
                                                        fontSize: 16.h,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.h),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'FREE',
                                                          style: TextStyle(
                                                            color:
                                                                SwColors.blue1,
                                                            fontSize: 12.h,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Text(
                                                          'Tips',
                                                          style: TextStyle(
                                                            color:
                                                                SwColors.whate,
                                                            fontSize: 12.h,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (_, i) =>
                                        SizedBox(height: 12.h),
                                    itemCount: listTipsCon.length,
                                  );
                                }),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
