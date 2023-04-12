import 'package:domain_models/domain_models.dart';
import 'package:key_value_storage/key_value_storage.dart';
import 'package:news_api/news_api.dart';
import 'package:news_repository/src/mappers/mappers.dart';
import 'package:news_repository/src/news_local_storage.dart';

class NewsRepository {
  NewsRepository({
    required KeyValueStorage keyValueStorage,
    required this.remoteApi,
    NewsLocalStorage? localStorage,
  }) : _localStorage = localStorage ??
            NewsLocalStorage(
              keyValueStorage: keyValueStorage,
            );

  final NewsApi remoteApi;
  final NewsLocalStorage _localStorage;

  Stream<ArticleListPage> getArticleListPage(
    int pageNumber, {
    required ArticleListaPageFetchPolicy fetchPolicy,
    Category? category,
    String searchTerm = '',
  }) async* {
    final isFilteringByCategory = category != null;
    final isSearching = searchTerm.isNotEmpty;
    final isFetchPolicyNetworkOnly =
        fetchPolicy == ArticleListaPageFetchPolicy.networkOnly;
    final shouldSkipCacheLookup =
        isFilteringByCategory || isSearching || isFetchPolicyNetworkOnly;

    if (shouldSkipCacheLookup) {
      final freshPage = await _getArticleListPageFromNetwork(
        pageNumber,
        category: category,
        searchTerm: searchTerm,
      );

      yield freshPage;
    } else {
      final cachePage = await _localStorage.getArticleListPage(
        pageNumber,
      );

      final isFetchPolicyCacheAndNetwork =
          fetchPolicy == ArticleListaPageFetchPolicy.cacheAndNetwork;

      final isFetchPolicyCachePreferably =
          fetchPolicy == ArticleListaPageFetchPolicy.cachePreferably;

      final shouldEmitCachedPageInAdvance =
          isFetchPolicyCachePreferably || isFetchPolicyCacheAndNetwork;

      if (shouldEmitCachedPageInAdvance && cachePage != null) {
        yield cachePage.toDomainModel();
        if (isFetchPolicyCachePreferably) {
          return;
        }
      }
      try {
        final freshPage = await _getArticleListPageFromNetwork(
          pageNumber,
        );

        yield freshPage;
      } catch (e) {
        final isFetchPolicyNetworkPreferably =
            fetchPolicy == ArticleListaPageFetchPolicy.networkPreferably;

        if (isFetchPolicyNetworkPreferably && cachePage != null) {
          yield cachePage.toDomainModel();
          return;
        }
        rethrow;
      }
    }
  }

  Future<ArticleListPage> _getArticleListPageFromNetwork(
    int pageNumber, {
    Category? category,
    String searchTerm = '',
  }) async {
    try {
      final apiPage = await remoteApi.getArticleListPage(
        pageNumber,
        category: category?.toRemoteModel(),
        searchTerm: searchTerm,
      );

      final isFiltering = category != null || searchTerm.isNotEmpty;

      final shouldStoreOnCache = !isFiltering;
      if (shouldStoreOnCache) {
        final shouldEmptyCache = pageNumber == 1;
        if (shouldEmptyCache) {
          await _localStorage.clearArticleListPage();
        }

        final cachePage = apiPage.toCacheModel();
        await _localStorage.upsertNewsArticleListPage(
          pageNumber,
          cachePage,
        );
      }

      final domainPage = apiPage.toDomainModel();
      return domainPage;
    } catch (_) {
      rethrow;
    }
  }
}

enum ArticleListaPageFetchPolicy {
  cacheAndNetwork,
  networkOnly,
  networkPreferably,
  cachePreferably,
}
