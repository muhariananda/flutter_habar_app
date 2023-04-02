import 'package:domain_models/src/article.dart';
import 'package:equatable/equatable.dart';

class ArticleListPage extends Equatable {
  const ArticleListPage({
    required this.totalResults,
    required this.articles,
  });

  final int totalResults;
  final List<Article> articles;

  @override
  List<Object> get props => [totalResults, articles];
}
