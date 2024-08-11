// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 0;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      showOnboarding: fields[0] as bool,
      termsOfUseUri: fields[1] as String,
      privacyPolicyUri: fields[2] as String,
      applicationInformationUri: fields[3] as String,
      appDir: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.showOnboarding)
      ..writeByte(1)
      ..write(obj.termsOfUseUri)
      ..writeByte(2)
      ..write(obj.privacyPolicyUri)
      ..writeByte(3)
      ..write(obj.applicationInformationUri)
      ..writeByte(4)
      ..write(obj.appDir);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
