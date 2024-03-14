import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/stopwatch/logic/cubit/delete_timer/delete_timer_cubit.dart';
import 'package:swim_wave_117/stopwatch/logic/cubit/get_timer/get_timer_cubit.dart';
import 'package:swim_wave_117/stopwatch/logic/cubit/update_timer/update_timer_cubit.dart';
import 'package:swim_wave_117/stopwatch/logic/model/timer_hive_model.dart';
import 'package:swim_wave_117/stopwatch/logic/repo/timer_repo.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    required this.model,
    required this.onsss,
  });
  final TimerHiveModel model;
  final ValueChanged onsss;
  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  late int _elapsedSeconds;
  bool _isRunning = false;
  late bool _isStopped;

  @override
  void initState() {
    super.initState();
    fff();
    context.read<GetTimerCubit>().getAddTimer();
    _timer = Timer(Duration.zero, () {});
  }

  void fff() {
    setState(() {
      _elapsedSeconds = widget.model.timer;
      _isStopped = widget.model.isStopped;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final int minutes = (seconds ~/ 60);
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _toggleTimer() {
    setState(() {
      if (_isRunning) {
        _timer.cancel();
        _isRunning = false;
      } else {
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            _elapsedSeconds++;
          });
        });
        _isRunning = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: SwColors.blue2.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(20),
          color: SwColors.blue084685),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                _formatTime(_elapsedSeconds),
                style: TextStyle(
                  color: SwColors.whate,
                  fontSize: 40.h,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              _isStopped
                  ? SwMotion(
                      onPressed: () async {
                        await _showDeleteDialog(context);
                        widget.onsss('');
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: SwColors.blue1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: SwColors.whate,
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        SwMotion(
                          onPressed: _toggleTimer,
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: SwColors.blue1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              _isRunning ? Icons.pause : Icons.play_arrow,
                              color: SwColors.whate,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        BlocProvider(
                          create: (context) =>
                              UpdateTimerCubit(TimerRepoImpl()),
                          child:
                              BlocConsumer<UpdateTimerCubit, UpdateTimerState>(
                            listener: (context, state) {
                              state.whenOrNull(
                                success: () {
                                  _timer.cancel();
                                  _isRunning = false;
                                  _isStopped = true;
                                },
                              );
                            },
                            builder: (context, state) {
                              return SwMotion(
                                onPressed: _elapsedSeconds == 0
                                    ? () {}
                                    : () {
                                        setState(() {
                                          _timer.cancel();
                                          _isRunning = false;
                                          _isStopped = true;
                                        });
                                        context
                                            .read<UpdateTimerCubit>()
                                            .updateTimerAll(widget.model.id,
                                                _elapsedSeconds);
                                        widget.onsss('');
                                      },
                                child: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: SwColors.blue1,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.stop,
                                    color: SwColors.whate,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ],
          ),
          Text(
            widget.model.name,
            style: TextStyle(
              color: SwColors.whate,
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'Do we delete?',
            style: TextStyle(
              fontSize: 17.h,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Are you sure you want to delete that stopwatch?',
            style: TextStyle(
              fontSize: 12.h,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'No',
                style: TextStyle(
                  color: Color(0xff007AFF),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => DeleteTimerCubit(TimerRepoImpl()),
              child: BlocConsumer<DeleteTimerCubit, DeleteTimerState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      Navigator.pop(context);
                    },
                  );
                },
                builder: (context, state) {
                  return CupertinoButton(
                    onPressed: () {
                      context.read<DeleteTimerCubit>().delete(widget.model.id);
                    },
                    child: const Text(
                      'Yes',
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
