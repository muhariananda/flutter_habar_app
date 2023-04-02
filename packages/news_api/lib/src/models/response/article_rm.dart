import 'package:json_annotation/json_annotation.dart';
import 'package:news_api/src/models/response/source_rm.dart';

part 'article_rm.g.dart';

@JsonSerializable(createToJson: false)
class ArticleRM {
  ArticleRM({
    required this.source,
    required this.author,
    required this.title,
    required this.url,
    required this.publishedAt,
    this.description,
    this.content,
    this.urlToImage,
  });

  final SourceRM source;
  final String author;
  final String title;
  final String url;
  final String publishedAt;
  final String? description;
  final String? content;
  final String? urlToImage;

  static const fromJson = _$ArticleRMFromJson;
}
