// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SourceCMAdapter extends TypeAdapter<SourceCM> {
  @override
  final int typeId = 3;

  @override
  SourceCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SourceCM(
      name: fields[1] as String?,
      id: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SourceCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
