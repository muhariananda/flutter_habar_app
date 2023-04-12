import 'package:key_value_storage/key_value_storage.dart';
import 'package:news_api/news_api.dart';

extension ArticleListPageRMtoCM on ArticleListPageRM {
  ArticleListPageCM toCacheModel() => ArticleListPageCM(
        totalResults: totalResults,
        articles: articles
            .map(
              (article) => article.toCacheModel(),
            )
            .toList(),
      );
}

extension ArticleRMtoCM on ArticleRM {
  ArticleCM toCacheModel() => ArticleCM(
        source: source.toCacheModel(),
        title: title,
        url: url,
        publishedAt: publishedAt,
        author: author,
        description: description,
        content:  content,
        urlToImage: urlToImage,
      );
}

extension SourceRMtoCM on SourceRM {
  SourceCM toCacheModel() => SourceCM(
        id: id,
        name: name,
      );
}
