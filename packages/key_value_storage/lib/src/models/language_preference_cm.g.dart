// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_preference_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguagePreferenceCMAdapter extends TypeAdapter<LanguagePreferenceCM> {
  @override
  final int typeId = 5;

  @override
  LanguagePreferenceCM read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LanguagePreferenceCM.en;
      case 1:
        return LanguagePreferenceCM.id;
      default:
        return LanguagePreferenceCM.en;
    }
  }

  @override
  void write(BinaryWriter writer, LanguagePreferenceCM obj) {
    switch (obj) {
      case LanguagePreferenceCM.en:
        writer.writeByte(0);
        break;
      case LanguagePreferenceCM.id:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguagePreferenceCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
