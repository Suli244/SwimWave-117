import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/fitness/detail_description/detail_description.dart';
import 'package:swim_wave_117/fitness/detail_fitness/widget/fitness_item.dart';
import 'package:swim_wave_117/fitness/model/fitness_model.dart';

class DetailFitnessSreen extends StatelessWidget {
  const DetailFitnessSreen({
    super.key,
    required this.fitnessModel,
    required this.titleMainAp,
  });
  final FitnessMainModel fitnessModel;
  final String titleMainAp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwColors.blue,
      body: SafeArea(
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
                  Expanded(
                    child: Text(
                      titleMainAp,
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final indd = fitnessModel.detailModels[index];
                    return DetailFitnessItem(
                      title: indd.titleAppBarDetail,
                      imag: indd.image,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) => DetailDescription(
                              titleApDetail: indd.titleAppBarDetail,
                              title: indd.title,
                              url: indd.video,
                              des: indd.description,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: fitnessModel.detailModels.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
