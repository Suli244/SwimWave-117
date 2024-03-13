import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';

class SafetyWidget extends StatelessWidget {
  const SafetyWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
  });
  final void Function() onTap;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.h),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: SwColors.blue084685,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: SwColors.whate,
                fontSize: 16.h,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: SwColors.whate,
                fontSize: 12.h,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
