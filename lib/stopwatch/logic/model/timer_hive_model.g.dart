// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerHiveModelAdapter extends TypeAdapter<TimerHiveModel> {
  @override
  final int typeId = 0;

  @override
  TimerHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimerHiveModel(
      id: fields[0] as int,
      timer: fields[1] as int,
      name: fields[2] as String,
      isStopped: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TimerHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.timer)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.isStopped);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
