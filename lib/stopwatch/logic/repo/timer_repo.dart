import 'package:hive_flutter/hive_flutter.dart';
import 'package:swim_wave_117/stopwatch/logic/model/timer_hive_model.dart';

abstract class TimerRepo {
  Future<List<TimerHiveModel>> getTimer();
  Future<void> setTimer(TimerHiveModel timerHiveModel);
}

class TimerRepoImpl implements TimerRepo {
  @override
  Future<List<TimerHiveModel>> getTimer() async {
    final timerBox = await Hive.openBox<TimerHiveModel>('TimerBox');
    return timerBox.values.toList();
  }

  @override
  Future<void> setTimer(TimerHiveModel timerHiveModel) async {
    final timerBox = await Hive.openBox<TimerHiveModel>('TimerBox');
    await timerBox.add(timerHiveModel);
  }
}
