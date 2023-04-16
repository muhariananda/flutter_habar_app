import 'package:hive/hive.dart';
import 'package:key_value_storage/src/models/models.dart';
import 'package:path_provider/path_provider.dart';

class KeyValueStorage {
  KeyValueStorage({
    HiveInterface? hive,
  }) : _hive = hive ?? Hive {
    try {
      _hive
        ..registerAdapter(ArticleListPageCMAdapter())
        ..registerAdapter(ArticleCMAdapter())
        ..registerAdapter(SourceCMAdapter());
    } catch (_) {
      throw Exception(
        "You shouldn't have more than one [KeyValueStorage] instance in your "
        'project.',
      );
    }
  }

  static const _articleListPageBoxKey = 'article-list-page';
  static const _bookmarkArticleListPageBoxKey = 'bookmark-article-list-page';

  final HiveInterface _hive;

  Future<Box<ArticleListPageCM>> get articleListPageBox =>
      _openHiveBox<ArticleListPageCM>(
        _articleListPageBoxKey,
        isTempoary: true,
      );

  Future<Box<ArticleListPageCM>> get bookmarkArticleListPage =>
      _openHiveBox<ArticleListPageCM>(
        _bookmarkArticleListPageBoxKey,
        isTempoary: true,
      );

  Future<Box<T>> _openHiveBox<T>(
    String boxKey, {
    required bool isTempoary,
  }) async {
    if (_hive.isBoxOpen(boxKey)) {
      return _hive.box(boxKey);
    } else {
      final directory = await (isTempoary
          ? getTemporaryDirectory()
          : getApplicationDocumentsDirectory());
      return _hive.openBox<T>(
        boxKey,
        path: directory.path,
      );
    }
  }
}
