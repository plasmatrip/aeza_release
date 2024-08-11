// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReleaseAdapter extends TypeAdapter<Release> {
  @override
  final int typeId = 3;

  @override
  Release read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Release(
      name: fields[0] as String,
      description: fields[4] as String,
      project: (fields[5] as HiveList?)?.castHiveList(),
      date: fields[1] as DateTime?,
      time: fields[2] as DateTime?,
      status: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Release obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.project);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReleaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
