import 'dart:convert';
import 'dart:developer';

import 'package:domain_models/domain_models.dart';
import 'package:go_router/go_router.dart';
import 'package:news_detail/news_detail.dart';
import 'package:news_list/news_list.dart';
import 'package:news_repository/news_repository.dart';

GoRouter configureRoutes({
  required NewsRepository newsRepository,
}) =>
    GoRouter(
      routes: [
        GoRoute(
          path: _PathConstants.tabConatinerPath,
          builder: (context, state) => NewsListScreen(
            newsRepository: newsRepository,
            onArticleSelected: (selectedArticle) {
              context.push(
                _PathConstants.newsDetailPath,
                extra: jsonEncode(selectedArticle.toJson()),
              );
            },
          ),
        ),
        GoRoute(
          path: _PathConstants.newsDetailPath,
          builder: (context, state) {
            final articleJson = state.extra as String?;
            final articleMap = jsonDecode(articleJson!) as Map<String, dynamic>;
            final article = Article.fromJson(articleMap);

            return NewsDetailScreen(
              article: article,
              newsRepository: newsRepository,
            );
          },
        )
      ],
    );

class _PathConstants {
  const _PathConstants._();

  static String get tabConatinerPath => '/';

  static String get newsListPath => '${tabConatinerPath}news';

  static String get newsDetailPath => '${tabConatinerPath}detail';
}
