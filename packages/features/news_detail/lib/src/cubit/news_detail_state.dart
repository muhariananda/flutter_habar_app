part of 'news_detail_cubit.dart';

class NewsDetailState extends Equatable {
  const NewsDetailState({
    this.progress = 0,
    this.isBookmark = false,
  });

  final double progress;
  final bool isBookmark;

  @override
  List<Object> get props => [progress, isBookmark];

  NewsDetailState copyWith({
    double? progress,
    bool? isBookmark,
  }) {
    return NewsDetailState(
      progress: progress ?? this.progress,
      isBookmark: isBookmark ?? this.isBookmark,
    );
  }
}
