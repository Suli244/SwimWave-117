import 'package:hive_flutter/hive_flutter.dart';

import 'swim_local_model.dart';

class SwimRepository {
  Future<SwimLocalModel?> swimHGet() async {
    final swimH = await Hive.openBox<SwimLocalModel>('swimH');
    return swimH.get('swimH');
  }

  Future<void> swimHSet(SwimLocalModel swimHGet) async {
    final swimH = await Hive.openBox<SwimLocalModel>('swimH');
    await swimH.put('swimH', swimHGet);
  }
}
