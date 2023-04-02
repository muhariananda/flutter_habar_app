import 'package:json_annotation/json_annotation.dart';

import 'package:news_api/src/models/response/article_rm.dart';

part 'article_list_page_rm.g.dart';

@JsonSerializable(createToJson: false)
class ArticleListPageRM {
  ArticleListPageRM({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<ArticleRM> articles;

  static const fromJson = _$ArticleListPageRMFromJson;
}
