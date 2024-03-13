import 'package:hive_flutter/hive_flutter.dart';

part 'timer_hive_model.g.dart';

@HiveType(typeId: 0)
class TimerHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int timer;
  @HiveField(2)
  String name;
  @HiveField(3)
  bool isStopped;
  TimerHiveModel({
    required this.id,
    required this.timer,
    required this.name,
    required this.isStopped,
  });
}
