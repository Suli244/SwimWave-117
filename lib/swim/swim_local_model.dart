import 'package:hive_flutter/hive_flutter.dart';

part 'swim_local_model.g.dart';

@HiveType(typeId: 4)
class SwimLocalModel extends HiveObject {
  @HiveField(0)
  String regswim;
  @HiveField(1)
  String logswim;
  @HiveField(2)
  bool strtswim;
  @HiveField(3)
  String cabswim;

  SwimLocalModel({
    required this.strtswim,
    required this.logswim,
    required this.regswim,
    required this.cabswim,
  });
}
