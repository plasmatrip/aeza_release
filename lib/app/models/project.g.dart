// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  final int typeId = 1;

  @override
  Project read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Project(
      name: fields[0] as String,
      description: fields[4] as String,
      start: fields[1] as DateTime?,
      end: fields[2] as DateTime?,
      status: fields[3] as int?,
      tasks: (fields[5] as HiveList?)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.end)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.tasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
