import 'package:dio/dio.dart';
import 'package:news_api/src/models/models.dart';
import 'package:news_api/src/url_builder.dart';

class NewsApi {
  NewsApi({
    Dio? dio,
    UrlBuilder? urlBuilder,
  })  : _dio = dio ?? Dio(),
        _urlBuilder = urlBuilder ?? const UrlBuilder() {
    _dio
      ..setUpHeaders()
      ..interceptors.add(LogInterceptor());
  }

  final Dio _dio;
  final UrlBuilder _urlBuilder;

  Future<ArticleListPageRM> getArticleListPage(
    int pageNumber, {
    String? category,
    String searchTerm = '',
  }) async {
    final url = _urlBuilder.buildGetArticleListPage(
      pageNumber,
      category: category,
      searchTerm: searchTerm,
    );
    
    // ignore: inference_failure_on_function_invocation
    final response = await _dio.get(url);
    final jsonObject = response.data as Map<String, dynamic>;
    final articleListPage = ArticleListPageRM.fromJson(jsonObject);
    final aricles = articleListPage.articles;

    if (aricles.isEmpty) {
      throw EmptySearchResultNewsException();
    }

    return articleListPage;
  }
}

extension on Dio {
  static const _appTokenEnvironmentVariableKey = 'news-app-token';

  void setUpHeaders() {
    const appToken = String.fromEnvironment(
      _appTokenEnvironmentVariableKey,
    );

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $appToken';
          return handler.next(options);
        },
      ),
    );
  }
}
