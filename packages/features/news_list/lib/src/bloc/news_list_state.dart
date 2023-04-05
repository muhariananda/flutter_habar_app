part of 'news_list_bloc.dart';

class NewsListState extends Equatable {
  const NewsListState({
    this.itemList,
    this.nextPage,
    this.filter,
    this.error,
    this.refreshError,
  });

  NewsListState.loadingNewCategory({
    required Category? category,
  }) : this(
          filter: category != null ? NewsListFilterByCategory(category) : null,
        );

  NewsListState.loadingNewSearchTerm({
    required String searchTerm,
  }) : this(
          filter: searchTerm.isNotEmpty
              ? NewsListFilterBySearchTerm(searchTerm)
              : null,
        );

  const NewsListState.noItemsFound({
    required NewsListFilter? filter,
  }) : this(
          itemList: const [],
          error: null,
          nextPage: 1,
          filter: filter,
        );

  const NewsListState.success({
    required int? nextPage,
    required List<Article> itemList,
    required NewsListFilter? filter,
    // required bool isRefresh,
  }) : this(
          nextPage: nextPage,
          itemList: itemList,
          filter: filter,
        );

  final List<Article>? itemList;
  final int? nextPage;
  final NewsListFilter? filter;
  final dynamic error;
  final dynamic refreshError;

  NewsListState copyWithNewError(
    dynamic error,
  ) =>
      NewsListState(
        itemList: itemList,
        nextPage: nextPage,
        error: error,
        filter: filter,
      );

  NewsListState copyWithNewRefreshError(
    dynamic refreshError,
  ) =>
      NewsListState(
        itemList: itemList,
        nextPage: nextPage,
        error: error,
        filter: filter,
        refreshError: refreshError,
      );

  @override
  List<Object?> get props {
    return [
      itemList,
      nextPage,
      error,
      refreshError,
      filter,
    ];
  }
}

abstract class NewsListFilter extends Equatable {
  const NewsListFilter();

  @override
  List<Object?> get props => [];
}

class NewsListFilterByCategory extends NewsListFilter {
  const NewsListFilterByCategory(this.category);

  final Category category;

  @override
  List<Object?> get props => [category];
}

class NewsListFilterBySearchTerm extends NewsListFilter {
  const NewsListFilterBySearchTerm(this.searchTerm);

  final String searchTerm;

  @override
  List<Object?> get props => [searchTerm];
}
