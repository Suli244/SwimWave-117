import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/stopwatch/logic/model/timer_hive_model.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    required this.model,
  });
  final TimerHiveModel model;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  late int _elapsedSeconds = widget.model.timer;
  bool _isRunning = false;
  late bool _isStopped = widget.model.isStopped;

  @override
  void dispose() {
    _timer.cancel(); // Cancel any running timer when the widget is disposed
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

  void _stopTimer() {
    setState(() {
      _timer.cancel();
      _isRunning = false;
      _isStopped = true;
      
      // _elapsedSeconds = 0;
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
                      // Show delete button if timer is stopped
                      onPressed: () {
                        _showDeleteDialog(context);
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
                        SwMotion(
                          onPressed: _elapsedSeconds == 0 ? () {} : _stopTimer,
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

  void _showDeleteDialog(BuildContext context) {
    showDialog(
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
              child: const Text('No'),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
