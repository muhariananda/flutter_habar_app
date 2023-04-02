// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_page_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleListPageRM _$ArticleListPageRMFromJson(Map<String, dynamic> json) =>
    ArticleListPageRM(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
