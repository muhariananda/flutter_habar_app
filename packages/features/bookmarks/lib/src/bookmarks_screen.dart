import 'package:bookmarks/src/cubit/bookmarks_cubit.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';

typedef ArticleSelected = void Function(Article);

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({
    required this.newsRepository,
    this.onSelectedArticle,
    super.key,
  });

  final NewsRepository newsRepository;
  final ArticleSelected? onSelectedArticle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarksCubit>(
      create: (_) => BookmarksCubit(
        newsRepository: newsRepository,
      ),
      child: BookmarksView(
        onSelectedArticle: onSelectedArticle,
      ),
    );
  }
}

class BookmarksView extends StatelessWidget {
  const BookmarksView({
    this.onSelectedArticle,
    super.key,
  });

  final ArticleSelected? onSelectedArticle;

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    return StyledStatusBar.dark(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.screenMargin,
          vertical: Spacing.mediumLarge,
        ),
        child: BlocBuilder<BookmarksCubit, BookmarksState>(
          builder: (context, state) {
            if (state is BookmarksEmpty) {
              return const EmptyItemsIndicator();
            } else if (state is BookmarksLoaded) {
              final articles = state.items;
              return ListView.separated(
                itemCount: articles.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: Spacing.mediumLarge);
                },
                itemBuilder: (BuildContext context, int index) {
                  final article = articles[index];
                  return ArticleCardInSmall(
                    title: article.title,
                    source: article.source.name,
                    publishedAt: article.publishedAt,
                    imageUrl: article.urlToImage,
                    onTap: () {
                      onSelectedArticle?.call(article);
                    },
                  );
                },
              );
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}
