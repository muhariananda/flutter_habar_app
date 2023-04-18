import 'package:domain_models/src/source.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article extends Equatable {
  const Article({
    required this.source,
    required this.author,
    required this.title,
    required this.url,
    required this.publishedAt,
    required this.description,
    required this.content,
    required this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  final Source source;
  final String author;
  final String title;
  final String url;
  final String publishedAt;
  final String description;
  final String content;
  final String urlToImage;

  @override
  List<Object> get props {
    return [
      source,
      author,
      title,
      url,
      publishedAt,
      description,
      content,
      urlToImage,
    ];
  }
}
