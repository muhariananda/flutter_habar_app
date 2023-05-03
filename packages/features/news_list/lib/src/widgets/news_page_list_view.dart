import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_list/news_list.dart';
import 'package:news_list/src/bloc/news_list_bloc.dart';

class NewsPageListView extends StatelessWidget {
  const NewsPageListView({
    required this.pagingController,
    this.onArticleSelected,
    super.key,
  });

  final PagingController<int, Article> pagingController;
  final ArticleSelected? onArticleSelected;

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    final bloc = context.read<NewsListBloc>();
    final onArticleSelected = this.onArticleSelected;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.screenMargin,
      ),
      child: PagedListView.separated(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<Article>(
          itemBuilder: (context, article, index) {
            final isIndexInMultiplesOfTen = index == 0 || index % 10 == 0;
            if (isIndexInMultiplesOfTen) {
              return ArticleCardInLarge(
                title: article.title,
                source: article.source.name,
                publishedAt: article.publishedAt,
                imageUrl: article.urlToImage,
                onTap: () => onArticleSelected?.call(article),
              );
            } else {
              return ArticleCardInSmall(
                title: article.title,
                source: article.source.name,
                publishedAt: article.publishedAt,
                imageUrl: article.urlToImage,
                onTap: () => onArticleSelected?.call(article),
              );
            }
          },
          firstPageErrorIndicatorBuilder: (_) => ExceptionIndicator(
            onTryAgain: () {
              bloc.add(
                const NewsListFailedFetchRetried(),
              );
            },
          ),
          noItemsFoundIndicatorBuilder: (_) => const EmptyResultIndicator(),
        ),
        separatorBuilder: (context, index) {
          return const SizedBox(height: Spacing.xLarge);
        },
      ),
    );
  }
}
