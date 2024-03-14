import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/safety/safety_txt.dart';

class SafetyTips extends StatelessWidget {
  const SafetyTips({super.key, required this.model});
  final SafetyTxt model;

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
                  const BackButton(color: SwColors.blue1),
                  Text(
                    'Safety tips',
                    style: TextStyle(
                      color: SwColors.whate,
                      fontSize: 20.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 45.w,
                    child: SwMotion(
                        onPressed: () {
                          Share.share(model.description);
                        },
                        child: const Icon(
                          Icons.ios_share,
                          color: SwColors.blue1,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      Text(
                        model.title,
                        style: TextStyle(
                          color: SwColors.whate,
                          fontSize: 24.h,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        model.description,
                        style: TextStyle(
                          color: SwColors.whate,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
