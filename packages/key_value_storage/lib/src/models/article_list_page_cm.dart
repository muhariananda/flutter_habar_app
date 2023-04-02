import 'package:hive/hive.dart';
import 'package:key_value_storage/src/models/article_cm.dart';

part 'article_list_page_cm.g.dart';

@HiveType(typeId: 1)
class ArticleListPageCM {
  ArticleListPageCM({
    required this.totalResults,
    required this.articles,
  });

  @HiveField(1)
  final int totalResults;
  @HiveField(2)
  final List<ArticleCM> articles;
}
