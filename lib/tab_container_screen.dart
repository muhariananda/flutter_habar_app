import 'package:bookmarks/bookmarks.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:news_list/news_list.dart';
import 'package:news_repository/news_repository.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

typedef ItemSelected = void Function(Article article);

class TabContainerScreen extends StatefulWidget {
  const TabContainerScreen({
    required this.newsRepository,
    this.onItemSelected,
    super.key,
  });

  static const routeName = '/';

  final NewsRepository newsRepository;
  final ItemSelected? onItemSelected;

  @override
  State<TabContainerScreen> createState() => _TabContainerScreenState();
}

class _TabContainerScreenState extends State<TabContainerScreen> {
  final _tabs = <Widget>[];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabs
      ..add(
        NewsListScreen(
          newsRepository: widget.newsRepository,
          onArticleSelected: widget.onItemSelected,
        ),
      )
      ..add(
        BookmarksScreen(
          newsRepository: widget.newsRepository,
          onSelectedArticle: widget.onItemSelected,
        ),
      )
      ..add(
        Container(
          color: Colors.red,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;

    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _tabs,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.large,
          ),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            selectedItemColor: theme.colors.primary,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.home_rounded,
                ),
                title: const Text(
                  'Home',
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.bookmark_rounded,
                ),
                title: const Text(
                  'Bookmarks',
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.settings_rounded,
                ),
                title: const Text(
                  'Settings',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
