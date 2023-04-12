import 'package:domain_models/domain_models.dart';
import 'package:news_api/news_api.dart';

extension ArticleListPageRMtoDomain on ArticleListPageRM {
  ArticleListPage toDomainModel() => ArticleListPage(
        totalResults: totalResults,
        articles: articles
            .map(
              (article) => article.toDomainModel(),
            )
            .toList(),
      );
}

extension ArticleRMtoDomain on ArticleRM {
  Article toDomainModel() => Article(
        source: source.toDomainModel(),
        title: title,
        url: url,
        publishedAt: publishedAt,
        author: author ?? '',
        description: description ?? '',
        content: content ?? '',
        urlToImage: urlToImage ?? '',
      );
}

extension SourceRMtoDomain on SourceRM {
  Source toDomainModel() => Source(
        id: id,
        name: name ?? '',
      );
}
