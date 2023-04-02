// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_page_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleListPageCMAdapter extends TypeAdapter<ArticleListPageCM> {
  @override
  final int typeId = 1;

  @override
  ArticleListPageCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleListPageCM(
      totalResults: fields[1] as int,
      articles: (fields[2] as List).cast<ArticleCM>(),
    );
  }

  @override
  void write(BinaryWriter writer, ArticleListPageCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.totalResults)
      ..writeByte(2)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleListPageCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
