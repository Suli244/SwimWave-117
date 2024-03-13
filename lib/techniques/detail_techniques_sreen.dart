import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/settings/settings_screen.dart';

class DetailTechniquesSreen extends StatefulWidget {
  const DetailTechniquesSreen({super.key});

  @override
  State<DetailTechniquesSreen> createState() => _DetailTechniquesSreenState();
}

class _DetailTechniquesSreenState extends State<DetailTechniquesSreen> {
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      text == 'Techniques'
                          ? ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(),
                                  ],
                                );
                              },
                              separatorBuilder: (_, i) =>
                                  SizedBox(height: 12.h),
                              itemCount: 10,
                            )
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container();
                              },
                              separatorBuilder: (_, i) =>
                                  SizedBox(height: 12.h),
                              itemCount: 10,
                            )
                    ],
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

