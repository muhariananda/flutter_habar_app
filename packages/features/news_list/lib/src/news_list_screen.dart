import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_list/news_list.dart';
import 'package:news_list/src/bloc/news_list_bloc.dart';
import 'package:news_list/src/widgets/filter_horizontal_list.dart';
import 'package:news_list/src/widgets/news_page_list_view.dart';
import 'package:news_repository/news_repository.dart';

typedef ArticleSelected = void Function(Article selectedArticle);

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({
    required this.newsRepository,
    this.onArticleSelected,
    super.key,
  });

  final NewsRepository newsRepository;
  final ArticleSelected? onArticleSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsListBloc>(
      create: (_) => NewsListBloc(
        newsRepository: newsRepository,
      ),
      child: NewsListView(
        onArticleSelected: onArticleSelected,
      ),
    );
  }
}

class NewsListView extends StatefulWidget {
  const NewsListView({
    this.onArticleSelected,
    super.key,
  });

  final ArticleSelected? onArticleSelected;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  final ScrollController _scrollController = ScrollController();
  final PagingController<int, Article> _pagingController = PagingController(
    firstPageKey: 1,
  );

  final TextEditingController _searchBarController = TextEditingController();

  NewsListBloc get _bloc => context.read<NewsListBloc>();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageNumber) {
      final isSubsequentPage = pageNumber > 1;
      if (isSubsequentPage) {
        _bloc.add(
          NewsListNextPageRequested(
            pageNumber: pageNumber,
          ),
        );
      }
    });

    _searchBarController.addListener(() {
      _bloc.add(
        NewsListSearchTermChanged(
          _searchBarController.text,
        ),
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pagingController.dispose();
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    final l10n = NewsListLocalizations.of(context);

    return BlocListener<NewsListBloc, NewsListState>(
      listener: (context, state) {
        final searchBarText = _searchBarController.text;
        final isSearching =
            state.filter != null && state.filter is NewsListFilterBySearchTerm;

        if (searchBarText.isNotEmpty && !isSearching) {
          _searchBarController.text = '';
        }

        if (state.refreshError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                l10n.newsListRefreshErrorMessage,
              ),
            ),
          );
        }

        _pagingController.value = state.toPagingState();
      },
      child: SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTap: () => _releaseFocus(context),
            child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, _) => [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: theme.screenMargin,
                      right: theme.screenMargin,
                      top: Spacing.xxLarge,
                      bottom: Spacing.medium,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.listHeader,
                          style: theme.text.titleLarge,
                        ),
                        const SizedBox(height: Spacing.small),
                        Text(
                          l10n.listSubHeader,
                          style: theme.text.labelMedium,
                        )
                      ],
                    ),
                  ),
                ),
                SliverAppBar(
                  floating: true,
                  snap: true,
                  backgroundColor: theme.colors.background,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: theme.screenMargin,
                            ),
                            child: RoundedSearchBar(
                              controller: _searchBarController,
                            ),
                          ),
                          const FilterHorizontalList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              body: RefreshIndicator(
                onRefresh: _onRefresh,
                child: NewsPageListView(
                  pagingController: _pagingController,
                  onArticleSelected: widget.onArticleSelected,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() {
    _bloc.add(
      const NewsListRefreshed(),
    );
    final stateChangeFuture = _bloc.stream.first;
    return stateChangeFuture;
  }

  void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();
}

extension on NewsListState {
  PagingState<int, Article> toPagingState() {
    return PagingState(
      itemList: itemList,
      nextPageKey: nextPage,
      error: error,
    );
  }
}
