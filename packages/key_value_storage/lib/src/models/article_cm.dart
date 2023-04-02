import 'package:hive/hive.dart';
import 'package:key_value_storage/src/models/source_cm.dart';

part 'article_cm.g.dart';

@HiveType(typeId: 2)
class ArticleCM {
  ArticleCM({
    required this.source,
    required this.author,
    required this.title,
    required this.url,
    required this.publishedAt,
    this.description,
    this.content,
    this.urlToImage,
  });

  @HiveField(1)
  final SourceCM source;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String url;

  @HiveField(5)
  final String publishedAt;

  @HiveField(6)
  final String? description;

  @HiveField(7)
  final String? content;

  @HiveField(8)
  final String? urlToImage;
}
