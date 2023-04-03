import 'package:domain_models/domain_models.dart';
import 'package:key_value_storage/key_value_storage.dart';

extension ArticleListPageCMtoDomain on ArticleListPageCM {
  ArticleListPage toDomainModel() => ArticleListPage(
        totalResults: totalResults,
        articles: articles
            .map(
              (article) => article.toDomainModel(),
            )
            .toList(),
      );
}

extension ArticleCMtoDomain on ArticleCM {
  Article toDomainModel() => Article(
        source: source.toDomainModel(),
        author: author,
        title: title,
        url: url,
        publishedAt: publishedAt,
        description: description ?? '',
        content: content ?? '',
        urlToImage: urlToImage,
      );
}

extension SourceCMtoDomain on SourceCM {
  Source toDomainModel() => Source(
        id: id,
        name: name,
      );
}
