part of 'news_list_bloc.dart';

abstract class NewsListEvent extends Equatable {
  const NewsListEvent();

  @override
  List<Object?> get props => [];
}

class NewsListOpened extends NewsListEvent {
  const NewsListOpened();
}

class NewsListRefreshed extends NewsListEvent {
  const NewsListRefreshed();
}

class NewsListFailedFetchRetried extends NewsListEvent {
  const NewsListFailedFetchRetried();
}

class NewsListCategoryChanged extends NewsListEvent {
  const NewsListCategoryChanged(
    this.category,
  );

  final Category? category;

  @override
  List<Object?> get props => [category];
}

class NewsListSearchTermChanged extends NewsListEvent {
  const NewsListSearchTermChanged(
    this.searchTerm,
  );

  final String searchTerm;

  @override
  List<Object?> get props => [searchTerm];
}

class NewsListNextPageRequested extends NewsListEvent {
  const NewsListNextPageRequested({
    required this.pageNumber,
  });

  final int pageNumber;

  @override
  List<Object?> get props => [pageNumber];
}
