import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';

class OnBoarItem extends StatelessWidget {
  const OnBoarItem({
    super.key,
    required this.imag,
    required this.tit,
    required this.dec,
  });
  final String imag;
  final String tit;
  final String dec;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imag,
          height: 445.h,
          width: 373.w,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        SizedBox(height: 20.h),
        Text(
          tit,
          style: TextStyle(
            color: SwColors.whate,
            fontSize: 24.h,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            dec,
            style: TextStyle(
              color: SwColors.whate,
              fontSize: 16.h,
              fontWeight: FontWeight.w400,
              height: 1.25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
