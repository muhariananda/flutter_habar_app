import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';

part 'news_detail_state.dart';

class NewsDetailCubit extends Cubit<NewsDetailState> {
  NewsDetailCubit({
    required this.article,
    required this.newsRepository,
  }) : super(
          const NewsDetailState(),
        ) {
    _isBookmark();
  }

  final Article article;
  final NewsRepository newsRepository;

  Future<void> _isBookmark() async {
    final result = await newsRepository.isBookmark(article.url);
    emit(
      state.copyWith(
        isBookmark: result,
      ),
    );
  }

  Future<void> bookmarkArticle() async {
    await newsRepository.bookmarkArticle(article);
    emit(
      state.copyWith(
        isBookmark: true,
      ),
    );
  }

  Future<void> unbookmarkArticle() async {
    await newsRepository.unbookmarkArticle(article.url);
    emit(
      state.copyWith(
        isBookmark: false,
      ),
    );
  }

  void onProgress(double progress) {
    emit(
      state.copyWith(
        progress: progress,
      ),
    );
  }
}
