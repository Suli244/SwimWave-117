import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:swim_wave_117/core/swimwave_apsaksas.dart';
import 'package:swim_wave_117/core/urls.dart';
import 'package:swim_wave_117/splash/splllaashoaivsa.dart';
import 'package:swim_wave_117/stopwatch/logic/cubit/get_timer/get_timer_cubit.dart';
import 'package:swim_wave_117/stopwatch/logic/model/timer_hive_model.dart';
import 'package:swim_wave_117/stopwatch/logic/repo/timer_repo.dart';
import 'package:swim_wave_117/swim/swim_local_model.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.initialize(DocFF.oneAppId);
  await OneSignal.Notifications.requestPermission(true);
  await SwimwaveAdapty().initializeSwimwaveAdapty();
  await Hive.initFlutter();
  Hive.registerAdapter(TimerHiveModelAdapter());
  Hive.registerAdapter(SwimLocalModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTimerCubit(TimerRepoImpl()),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Swim Wave',
          home: child,
          theme: ThemeData(
            fontFamily: 'Roboto',
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
        ),
        child: const SpSc(),
      ),
    );
  }
}
