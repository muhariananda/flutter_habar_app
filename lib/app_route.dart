import 'package:go_router/go_router.dart';
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
              // ! TODO : Add Route to Detail Screen
            },
          ),
        )
      ],
    );

class _PathConstants {
  const _PathConstants._();

  static String get tabConatinerPath => '/';

  static String get newsListPath => '${tabConatinerPath}news';
}
