import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/settings/settings_screen.dart';
import 'package:swim_wave_117/stopwatch/widgets/timer_widget.dart';

class StopwatchSreen extends StatefulWidget {
  const StopwatchSreen({super.key});

  @override
  State<StopwatchSreen> createState() => _StopwatchSreenState();
}

class _StopwatchSreenState extends State<StopwatchSreen> {
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
                    SizedBox(width: 24.w),
                    Text(
                      'Stopwatch',
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SwMotion(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsSreen(),
                            ));
                      },
                      child: Image.asset(
                        'assets/icons/icon_setting.png',
                        width: 24.w,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                const TimerWidget(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SwMotion(
        onPressed: () {
          _showAddStopwatchDialog(context);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.r),
          width: MediaQuery.of(context).size.width,
          height: 68.h,
          decoration: BoxDecoration(
            color: SwColors.blue1,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              'Add stopwatch ',
              style: TextStyle(
                color: SwColors.whate,
                fontSize: 16.h,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAddStopwatchDialog(BuildContext context) {
    String stopwatchName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'Starting the timer',
            style: TextStyle(
              fontSize: 17.h,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Column(
            children: [
              Text(
                'Write a name for the timer',
                style: TextStyle(
                  fontSize: 12.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16.h),
              CupertinoTextField(
                onChanged: (value) {
                  stopwatchName = value;
                },
                placeholder: 'Timer name',
              ),
            ],
          ),
          actions: [
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
                // _startStopwatch(stopwatchName, context);
              },
              child: const Text('Start'),
            ),
          ],
        );
      },
    );
  }
}
