import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/transformers.dart';

part 'news_list_event.dart';

part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(
          const NewsListState(),
        ) {
    _registerEventsHandler();

    add(
      const NewsListOpened(),
    );
  }

  final NewsRepository _newsRepository;

  void _registerEventsHandler() {
    on<NewsListEvent>(
      (event, emitter) async {
        if (event is NewsListOpened) {
          await _handleNewsListOpened(emitter);
        } else if (event is NewsListRefreshed) {
          await _handleNewsListRefreshed(emitter, event);
        } else if (event is NewsListFailedFetchRetried) {
          await _handleNewsListFailedFetchRetried(emitter);
        } else if (event is NewsListCategoryChanged) {
          await _handleNewsListCategoryChanged(emitter, event);
        } else if (event is NewsListSearchTermChanged) {
          await _handleNewsListSearchTermChanged(emitter, event);
        } else if (event is NewsListNextPageRequested) {
          await _handleNewsListNextPageRequested(emitter, event);
        }
      },
      transformer: (events, mapper) {
        final nonDebonceEventStream = events.where(
          (event) => event is! NewsListSearchTermChanged,
        );

        final debonceEventStream = events
            .whereType<NewsListSearchTermChanged>()
            .debounceTime(
              const Duration(seconds: 1),
            )
            .where(
          (event) {
            final previousFilter = state.filter;
            final previousSearchTerm =
                previousFilter is NewsListFilterBySearchTerm
                    ? previousFilter.searchTerm
                    : '';

            return event.searchTerm != previousSearchTerm;
          },
        );

        final mergedEventStream = MergeStream([
          nonDebonceEventStream,
          debonceEventStream,
        ]);

        final restartableTrasnformer = restartable<NewsListEvent>();

        return restartableTrasnformer(mergedEventStream, mapper);
      },
    );
  }

  Future<void> _handleNewsListOpened(
    Emitter<NewsListState> emitter,
  ) {
    final firstPageFetchStream = _fetchArticlePage(
      1,
      fetchPolicy: ArticleListaPageFetchPolicy.cacheAndNetwork,
    );

    return emitter.onEach(
      firstPageFetchStream,
      onData: emitter.call,
    );
  }

  Future<void> _handleNewsListRefreshed(
    Emitter<NewsListState> emitter,
    NewsListRefreshed event,
  ) {
    final firstPageFetchStream = _fetchArticlePage(
      1,
      fetchPolicy: ArticleListaPageFetchPolicy.networkOnly,
      isRefresh: true,
    );

    return emitter.onEach(
      firstPageFetchStream,
      onData: emitter.call,
    );
  }

  Future<void> _handleNewsListFailedFetchRetried(
    Emitter<NewsListState> emitter,
  ) {
    emitter(
      state.copyWithNewError(null),
    );

    final firstPageStream = _fetchArticlePage(
      1,
      fetchPolicy: ArticleListaPageFetchPolicy.cacheAndNetwork,
    );

    return emitter.onEach(
      firstPageStream,
      onData: emitter.call,
    );
  }

  Future<void> _handleNewsListCategoryChanged(
    Emitter<NewsListState> emitter,
    NewsListCategoryChanged event,
  ) {
    emitter(
      NewsListState.loadingNewCategory(
        category: event.category,
      ),
    );

    final firstPageStream = _fetchArticlePage(
      1,
      fetchPolicy: ArticleListaPageFetchPolicy.cachePreferably,
    );

    return emitter.onEach(
      firstPageStream,
      onData: emitter.call,
    );
  }

  Future<void> _handleNewsListSearchTermChanged(
    Emitter<NewsListState> emitter,
    NewsListSearchTermChanged event,
  ) {
    emitter(
      NewsListState.loadingNewSearchTerm(
        searchTerm: event.searchTerm,
      ),
    );

    final firtsPageStream = _fetchArticlePage(
      1,
      fetchPolicy: ArticleListaPageFetchPolicy.cachePreferably,
    );

    return emitter.onEach(
      firtsPageStream,
      onData: emitter.call,
    );
  }

  Future<void> _handleNewsListNextPageRequested(
    Emitter<NewsListState> emitter,
    NewsListNextPageRequested event,
  ) {
    emitter(
      state.copyWithNewError(null),
    );

    final nextPageFetchStream = _fetchArticlePage(
      event.pageNumber,
      fetchPolicy: ArticleListaPageFetchPolicy.networkPreferably,
    );

    return emitter.onEach(
      nextPageFetchStream,
      onData: emitter.call,
    );
  }

  Stream<NewsListState> _fetchArticlePage(
    int page, {
    required ArticleListaPageFetchPolicy fetchPolicy,
    bool isRefresh = false,
  }) async* {
    const pageSize = 20;

    final currentlyAppliedFilter = state.filter;

    final pageStream = _newsRepository.getArticleListPage(
      page,
      category: currentlyAppliedFilter is NewsListFilterByCategory
          ? currentlyAppliedFilter.category
          : null,
      searchTerm: currentlyAppliedFilter is NewsListFilterBySearchTerm
          ? currentlyAppliedFilter.searchTerm
          : '',
      fetchPolicy: fetchPolicy,
    );

    try {
      await for (final newPage in pageStream) {
        final newItemList = newPage.articles;
        final oldItemList = state.itemList ?? [];
        final completeItemList =
            isRefresh || page == 1 ? newItemList : (oldItemList + newItemList);

        final isLastPage = (pageSize * page) > newPage.totalResults;
        final nextPage = !isLastPage ? page + 1 : null;

        yield NewsListState.success(
          nextPage: nextPage,
          itemList: completeItemList,
          filter: currentlyAppliedFilter,
        );
      }
    } catch (error) {
      if (error is EmptySearchResultException) {
        yield NewsListState.noItemsFound(
          filter: currentlyAppliedFilter,
        );
      }

      if (isRefresh) {
        yield state.copyWithNewRefreshError(
          error,
        );
      } else {
        yield state.copyWithNewError(
          error,
        );
      }
    }
  }
}
