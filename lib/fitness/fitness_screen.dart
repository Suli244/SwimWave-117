import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/core/swimwave_psascovas.dart';
import 'package:swim_wave_117/fitness/detail_fitness/detail_fitness.dart';
import 'package:swim_wave_117/fitness/model/fitness_data.dart';
import 'package:swim_wave_117/fitness/widget/fitness_item.dart';
import 'package:swim_wave_117/premium/premium_screen.dart';
import 'package:swim_wave_117/settings/settings_screen.dart';

class FitnessSreen extends StatelessWidget {
  const FitnessSreen({super.key});
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
                      'Fitness',
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
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/premiumOnPre.png',
                            ),
                            SizedBox(height: 12.h),
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                Expanded(
                  child: FutureBuilder(
                      future: getSwimwavePichajs(),
                      builder: (context, snapshot) {
                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            final ind = mainFitnessList[index];
                            return FitnessItem(
                              title: ind.titleAppBarMain,
                              imag1: ind.image1,
                              imag2: ind.image2,
                              imag3: ind.image3,
                              imag4: ind.image4,
                              onTap: () {
                                if (snapshot.hasData && !snapshot.data!) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PremiumScreen(
                                        isClose: true,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailFitnessSreen(
                                        fitnessModel: mainFitnessList[index],
                                        titleMainAp: ind.titleAppBarMain,
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                          itemCount: mainFitnessList.length,
                        );
                      }),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
