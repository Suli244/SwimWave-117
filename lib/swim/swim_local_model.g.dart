// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swim_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SwimLocalModelAdapter extends TypeAdapter<SwimLocalModel> {
  @override
  final int typeId = 4;

  @override
  SwimLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SwimLocalModel(
      strtswim: fields[2] as bool,
      logswim: fields[1] as String,
      regswim: fields[0] as String,
      cabswim: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SwimLocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.regswim)
      ..writeByte(1)
      ..write(obj.logswim)
      ..writeByte(2)
      ..write(obj.strtswim)
      ..writeByte(3)
      ..write(obj.cabswim);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SwimLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
