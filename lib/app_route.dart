import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/tab_container_screen.dart';
import 'package:news_detail/news_detail.dart';
import 'package:news_repository/news_repository.dart';

Map<String, Widget Function(BuildContext context)> buildAppRoutes({
  required NewsRepository newsRepository,
}) {
  return {
    TabContainerScreen.routeName: (context) {
      return TabContainerScreen(
        newsRepository: newsRepository,
        onItemSelected: (article) {
          context.navigateTo(
            NewsDetailScreen.routeName,
            argument: article,
          );
        },
      );
    },
    NewsDetailScreen.routeName: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as Article?;
      return NewsDetailScreen(
        article: args!,
        newsRepository: newsRepository,
      );
    },
  };
}

extension on BuildContext {
  void navigateTo(String routeName, {Object? argument}) {
    Navigator.pushNamed(this, routeName, arguments: argument);
  }
}
