import 'dart:async';

import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';

part 'bookmarks_state.dart';

class BookmarksCubit extends Cubit<BookmarksState> {
  BookmarksCubit({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const BookmarksInitial()) {
    _articlesSubscription = _newsRepository.watchArticles().listen(
      (page) {
        final articles = page.articles;
        if (articles.isNotEmpty) {
          emit(
            BookmarksLoaded(articles),
          );
        } else {
          emit(
            const BookmarksEmpty(),
          );
        }
      },
    );
  }

  final NewsRepository _newsRepository;
  late StreamSubscription<ArticleListPage> _articlesSubscription;

  @override
  Future<void> close() {
    _articlesSubscription.cancel();
    return super.close();
  }
}
