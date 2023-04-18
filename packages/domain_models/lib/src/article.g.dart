// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      publishedAt: json['publishedAt'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      urlToImage: json['urlToImage'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'url': instance.url,
      'publishedAt': instance.publishedAt,
      'description': instance.description,
      'content': instance.content,
      'urlToImage': instance.urlToImage,
    };
