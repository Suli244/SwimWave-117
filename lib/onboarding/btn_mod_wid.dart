import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';

class BtnModWidget extends StatelessWidget {
  const BtnModWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.isBrColor = false,
    this.gradient,
  });
  final String text;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final Gradient? gradient;
  final bool isBrColor;
  @override
  Widget build(BuildContext context) {
    return SwMotion(
      onPressed: onPressed,
      child: Container(
        height: 52.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: gradient,
          color: isBrColor ? null : SwColors.whate,
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                  color: SwColors.blue,
                  fontSize: 16.h,
                  height: 0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
