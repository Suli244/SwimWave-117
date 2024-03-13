import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/techniques/content/tips_content.dart';

class DetailTipsSreen extends StatefulWidget {
  const DetailTipsSreen({super.key, required this.model});
  final TipsCon model;
  @override
  State<DetailTipsSreen> createState() => _DetailTipsSreenState();
}

class _DetailTipsSreenState extends State<DetailTipsSreen> {
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
                      'Tips',
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SwMotion(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/images/share.png',
                        width: 24.w,
                      ),
                    )
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
                    Image.asset(
                      widget.model.image,
                      height: 200.h,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
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
