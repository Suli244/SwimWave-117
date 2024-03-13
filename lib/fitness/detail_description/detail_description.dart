import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/fitness/detail_description/widget/youtube_player_widget_dateil.dart';

class DetailDescription extends StatefulWidget {
  const DetailDescription({
    super.key,
    required this.titleApDetail,
    required this.title,
    required this.url,
    required this.des,
  });
  final String titleApDetail;
  final String title;
  final String url;
  final String des;
  @override
  State<DetailDescription> createState() => _DetailDescriptionState();
}

class _DetailDescriptionState extends State<DetailDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwColors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Icons.arrow_back_rounded,
                        size: 27.h,
                        color: SwColors.blue3,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.titleApDetail,
                        style: TextStyle(
                          color: SwColors.whate,
                          fontSize: 20.h,
                          height: 1.1,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 24.w),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: SwColors.whate,
                    fontSize: 24.h,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                YoutubePlayeR(url: widget.url),
                SizedBox(height: 12.h),
                Text(
                  widget.des,
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
      ),
    );
  }
}
