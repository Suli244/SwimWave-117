import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:swim_wave_117/splash/splash_screen.dart';
import 'package:swim_wave_117/stopwatch/logic/model/timer_hive_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(
    TimerHiveModelAdapter(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Swim Wave',
        home: child,
        theme: ThemeData.light().copyWith(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
      ),
      child: const SplashScreen(),
    );
  }
}
