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
}
