import 'package:hive_flutter/hive_flutter.dart';
import 'package:swim_wave_117/stopwatch/logic/model/timer_hive_model.dart';

abstract class TimerRepo {
  Future<List<TimerHiveModel>> getTimer();
  Future<void> setTimer(TimerHiveModel timerHiveModel);
  Future<void> deleteTimer(int id);
  Future<void> updateTimer(int id, int timer);
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

  @override
  Future<void> deleteTimer(int id) async {
    final timerBox = await Hive.openBox<TimerHiveModel>('TimerBox');
    final timerModel = timerBox.values.toList().singleWhere((e) => e.id == id);
    await timerModel.delete();
    await timerBox.compact();
  }

  @override
  Future<void> updateTimer(int id, int timer) async {
    final timerBox = await Hive.openBox<TimerHiveModel>('TimerBox');
    List<TimerHiveModel> listTimerUp =
        timerBox.values.where((e) => e.id == id).toList();
    listTimerUp.first.timer = timer;
    listTimerUp.first.isStopped = true;
    await listTimerUp.first.save();
  }
}
