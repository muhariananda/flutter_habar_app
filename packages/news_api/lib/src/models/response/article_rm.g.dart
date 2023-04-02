// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleRM _$ArticleRMFromJson(Map<String, dynamic> json) => ArticleRM(
      source: SourceRM.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      publishedAt: json['publishedAt'] as String,
      description: json['description'] as String?,
      content: json['content'] as String?,
      urlToImage: json['urlToImage'] as String?,
    );
