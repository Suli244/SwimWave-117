import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/onboarding/btn_mod_wid.dart';

class PremiItem extends StatelessWidget {
  const PremiItem({
    super.key,
    required this.imag,
    required this.tit,
    this.onPressed,
    this.onPresseD,
    required this.prem,
  });
  final String imag;
  final String tit;
  final Function()? onPressed;
  final Function()? onPresseD;
  final bool prem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              imag,
              height: 452.h,
              width: 373.w,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SwMotion(
                  onPressed: onPresseD,
                  child: Image.asset(
                    'assets/images/x_premium_icon.png',
                    height: 19.h,
                    color: SwColors.blue2,
                  ),
                ),
                SizedBox(width: 25.w),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: FittedBox(
            child: Column(
              children: [
                Text(
                  tit,
                  style: TextStyle(
                    color: SwColors.whate,
                    fontSize: 24.h,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 13.h),
                Text(
                  '• no ads'.toUpperCase(),
                  style: TextStyle(
                    color: SwColors.whate,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 13.h),
                Text(
                  '• access to all tips and techniques'.toUpperCase(),
                  style: TextStyle(
                    color: SwColors.whate,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 13.h),
                Text(
                  '• access to all fitness training'.toUpperCase(),
                  style: TextStyle(
                    color: SwColors.whate,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35.h),
                BtnModWidget(
                  onPressed: onPressed,
                  text: prem == true ? 'Loading...' : 'BUY PREMIUM FOR \$0,99',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
