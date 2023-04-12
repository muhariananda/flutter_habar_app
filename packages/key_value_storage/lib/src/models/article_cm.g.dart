// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleCMAdapter extends TypeAdapter<ArticleCM> {
  @override
  final int typeId = 2;

  @override
  ArticleCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleCM(
      source: fields[1] as SourceCM,
      title: fields[2] as String,
      url: fields[3] as String,
      publishedAt: fields[4] as String,
      author: fields[5] as String?,
      description: fields[6] as String?,
      content: fields[7] as String?,
      urlToImage: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleCM obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.publishedAt)
      ..writeByte(5)
      ..write(obj.author)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.content)
      ..writeByte(8)
      ..write(obj.urlToImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
