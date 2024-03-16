import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/swim/yyyyyyyyy.dart';

class SpSc extends StatefulWidget {
  const SpSc({super.key});

  @override
  State<SpSc> createState() => _SpScState();
}

class _SpScState extends State<SpSc> {
  bool? jowehvonre;
  @override
  void initState() {
    yyyyyyyy(context, (val) {
      setState(() {
        jowehvonre = val;
      });
    });
    super.initState();
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: jowehvonre == null ? 0 : 1,
                child: Image.asset(
                  jowehvonre != null && jowehvonre!
                      ? 'assets/images/asdasdasda.png'
                      : 'assets/images/logo.png',
                  width: 260.w,
                  height: 180.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
