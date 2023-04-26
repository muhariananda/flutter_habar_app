import 'package:key_value_storage/key_value_storage.dart';

class NewsLocalStorage {
  NewsLocalStorage({
    required this.keyValueStorage,
  });

  final KeyValueStorage keyValueStorage;

  Future<void> upsertNewsArticleListPage(
    int pageNumber,
    ArticleListPageCM articleListPage,
  ) async {
    final box = await keyValueStorage.articleListPageBox;
    return box.put(
      pageNumber,
      articleListPage,
    );
  }

  Future<void> clearArticleListPage() async {
    final box = await keyValueStorage.articleListPageBox;
    await box.clear();
  }

  Future<ArticleListPageCM?> getArticleListPage(int pageNumber) async {
    final box = await keyValueStorage.articleListPageBox;
    return box.get(pageNumber);
  }

  Future<void> insertArticle(ArticleCM article) async {
    final box = await keyValueStorage.bookmarkArticles;
    return box.put(article.url, article);
  }

  Future<void> removeArticle(String url) async {
    final box = await keyValueStorage.bookmarkArticles;
    return box.delete(url);
  }

  Future<ArticleCM?> getArticle(String url) async {
    final box = await keyValueStorage.bookmarkArticles;
    return box.get(url);
  }

  Stream<ArticleListPageCM> watchArticles() async* {
    final box = await keyValueStorage.bookmarkArticles;

    final articles = box.values;
    yield ArticleListPageCM(
      totalResults: articles.length,
      articles: articles.reversedArticlesToList(),
    );

    yield* box.watch().map(
      (_) {
        final newArticles = box.values;
        return ArticleListPageCM(
          totalResults: newArticles.length,
          articles: newArticles.reversedArticlesToList(),
        );
      },
    );
  }
}

extension on Iterable<ArticleCM> {
  List<ArticleCM> reversedArticlesToList() {
    return toList().reversed.toList();
  }
}
