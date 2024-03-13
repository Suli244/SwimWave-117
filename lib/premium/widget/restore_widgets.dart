import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';

class RestoreButtons extends StatelessWidget {
  const RestoreButtons({
    super.key,
    required this.onPressTermOfService,
    required this.onPressRestorePurchase,
    required this.onPressPrivacyPolicy,
  });

  final Function() onPressTermOfService;
  final Function() onPressRestorePurchase;
  final Function() onPressPrivacyPolicy;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 20.w),
        InkWell(
          onTap: onPressPrivacyPolicy,
          child: Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: 12.h,
              fontWeight: FontWeight.w600,
              color: SwColors.blue1,
            ),
          ),
        ),
        InkWell(
          onTap: onPressRestorePurchase,
          child: Text(
            'Restore purchase',
            style: TextStyle(
              fontSize: 12.h,
              fontWeight: FontWeight.w600,
              color: SwColors.blue1,
            ),
          ),
        ),
        InkWell(
          onTap: onPressTermOfService,
          child: Text(
            'Term of Service',
            style: TextStyle(
              fontSize: 12.h,
              fontWeight: FontWeight.w600,
              color: SwColors.blue1,
            ),
          ),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
