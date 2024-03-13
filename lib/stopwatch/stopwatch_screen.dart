import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/con_bar.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/settings/settings_screen.dart';
import 'package:swim_wave_117/stopwatch/logic/cubit/get_timer/get_timer_cubit.dart';
import 'package:swim_wave_117/stopwatch/logic/cubit/set_timer/set_timer_cubit.dart';
import 'package:swim_wave_117/stopwatch/logic/model/timer_hive_model.dart';
import 'package:swim_wave_117/stopwatch/logic/repo/timer_repo.dart';
import 'package:swim_wave_117/stopwatch/widgets/timer_widget.dart';

class StopwatchSreen extends StatefulWidget {
  const StopwatchSreen({super.key});

  @override
  State<StopwatchSreen> createState() => _StopwatchSreenState();
}

class _StopwatchSreenState extends State<StopwatchSreen> {
  // @override
  // void initState() {
  //   context.read<GetTimerCubit>().getAddTimer();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTimerCubit(TimerRepoImpl())..getAddTimer(),
      child: Scaffold(
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
                  BlocBuilder<GetTimerCubit, GetTimerState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const Center(
                          child: SizedBox.square(
                            dimension: 24,
                            child: CircularProgressIndicator(
                              color: SwColors.blue1,
                              strokeWidth: 2.5,
                            ),
                          ),
                        ),
                        loading: () => const Center(
                          child: SizedBox.square(
                            dimension: 24,
                            child: CircularProgressIndicator(
                              color: SwColors.blue1,
                              strokeWidth: 2.5,
                            ),
                          ),
                        ),
                        error: (error) => Center(
                          child: Text(
                            error,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        success: (model) {
                          return model.isNotEmpty
                              ? Expanded(
                                  child: ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    shrinkWrap: true,
                                    itemCount: model.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 12),
                                    itemBuilder: (context, index) =>
                                        TimerWidget(
                                      model: model[index],
                                      onsss: (_) {
                                        context
                                            .read<GetTimerCubit>()
                                            .getAddTimer();
                                      },
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'You have no Timer',
                                    style: TextStyle(
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.w500,
                                      color: SwColors.whate,
                                    ),
                                  ),
                                );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(builder: (context) {
          return SwMotion(
            onPressed: () async {
              await _showAddStopwatchDialog(context);
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
          );
        }),
      ),
    );
  }

  Future<void> _showAddStopwatchDialog(BuildContext mainContext) async {
    String stopwatchName = '';

    await showDialog(
      context: mainContext,
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
              child: const Text(
                'Back',
                style: TextStyle(
                  color: Color(0xff007AFF),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => SetTimerCubit(TimerRepoImpl()),
              child: BlocConsumer<SetTimerCubit, SetTimerState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const SwBottomBar(
                      //               indexScr: 4,
                      //             )));
                      Navigator.pop(context);
                      mainContext.read<GetTimerCubit>().getAddTimer();
                    },
                  );
                },
                builder: (context, state) {
                  return CupertinoButton(
                    onPressed: () {
                      if (stopwatchName.isNotEmpty) {
                        TimerHiveModel model = TimerHiveModel(
                          id: DateTime.now().millisecondsSinceEpoch,
                          timer: 0,
                          name: stopwatchName,
                          isStopped: false,
                        );
                        context.read<SetTimerCubit>().setAddTimer(model);
                      }
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        color: Color(0xff007AFF),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
