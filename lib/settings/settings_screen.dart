import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/onboarding/btn_mod_wid.dart';
import 'package:swim_wave_117/premium/premium_screen.dart';

class SettingsSreen extends StatelessWidget {
  const SettingsSreen({super.key});
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
                    SwMotion(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 24.w,
                        color: SwColors.blue1,
                      ),
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 27.w)
                  ],
                ),
                SizedBox(height: 20.h),
                SwMotion(
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
                ),
                SizedBox(height: 12.h),
                const BtnModWidget(text: 'Restore purchase'),
                SizedBox(height: 12.h),
                const BtnModWidget(text: 'Privacy policy'),
                SizedBox(height: 12.h),
                const BtnModWidget(text: 'Terms of use'),
                SizedBox(height: 12.h),
                const BtnModWidget(text: 'Support'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
