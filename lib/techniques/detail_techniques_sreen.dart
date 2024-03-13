import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/fitness/detail_description/widget/youtube_player_widget_dateil.dart';
import 'package:swim_wave_117/techniques/content/techniques_content.dart';

class DetailTechniquesSreen extends StatefulWidget {
  const DetailTechniquesSreen({super.key, required this.model});
  final TechCon model;
  @override
  State<DetailTechniquesSreen> createState() => _DetailTechniquesSreenState();
}

class _DetailTechniquesSreenState extends State<DetailTechniquesSreen> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Techniques',
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 24.w),
                  ],
                ),
                SizedBox(height: 12.h),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Text(
                      'FREE',
                      style: TextStyle(
                        color: SwColors.blue1,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      widget.model.title,
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 24.h,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    YoutubePlayeR(url: widget.model.video),
                    SizedBox(height: 12.h),
                    Text(
                      widget.model.discr,
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
