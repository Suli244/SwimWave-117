import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swim_wave_117/challenge/challenge_screen.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/fitness/fitness_screen.dart';
import 'package:swim_wave_117/safety/safety_screen.dart';
import 'package:swim_wave_117/stopwatch/stopwatch_screen.dart';
import 'package:swim_wave_117/techniques/techniques_sreen.dart';

class SwBottomBarState extends State<SwBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: isActive,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 18.r,
          bottom: 40.r,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF084685),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => setState(() => isActive = 0),
              child: SvgPicture.asset(
                'assets/icons/tech.svg',
                color: isActive == 0 ? null : SwColors.blue2.withOpacity(0.5),
                width: 28.w,
              ),
            ),
            InkWell(
              onTap: () => setState(() => isActive = 1),
              child: SvgPicture.asset(
                'assets/icons/safety.svg',
                color: isActive == 1 ? null : SwColors.blue2.withOpacity(0.5),
                width: 28.w,
              ),
            ),
            InkWell(
              onTap: () => setState(() => isActive = 2),
              child: SvgPicture.asset(
                'assets/icons/fitness.svg',
                color: isActive == 2 ? null : SwColors.blue2.withOpacity(0.5),
                width: 28.w,
              ),
            ),
            InkWell(
              onTap: () => setState(() => isActive = 3),
              child: SvgPicture.asset(
                'assets/icons/chalenge.svg',
                color: isActive == 3 ? null : SwColors.blue2.withOpacity(0.5),
                width: 28.w,
              ),
            ),
            InkWell(
              onTap: () => setState(() => isActive = 4),
              child: SvgPicture.asset(
                'assets/icons/stop.svg',
                color: isActive == 4 ? null : SwColors.blue2.withOpacity(0.5),
                width: 28.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  late int isActive = widget.indexScr;
  final _pages = <Widget>[
    const TechniquesSreen(),
    const SafetySreen(),
    const FitnessSreen(),
    const ChallengeSreen(),
    const StopwatchSreen(),
  ];
}

class SwBottomBar extends StatefulWidget {
  const SwBottomBar({super.key, this.indexScr = 0});
  final int indexScr;

  @override
  State<SwBottomBar> createState() => SwBottomBarState();
}
