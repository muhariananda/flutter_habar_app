import 'package:bookmarks/bookmarks.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/l10n/app_localizations.dart';
import 'package:news_list/news_list.dart';
import 'package:news_repository/news_repository.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:settings/settings.dart';
import 'package:settings_repository/settings_repository.dart';

typedef ItemSelected = void Function(Article article);

class TabContainerScreen extends StatefulWidget {
  const TabContainerScreen({
    required this.newsRepository,
    required this.settingsRepository,
    this.onItemSelected,
    super.key,
  });

  static const routeName = '/';

  final NewsRepository newsRepository;
  final SettingsRepository settingsRepository;
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
        SettingsScreen(
          settingsRepository: widget.settingsRepository,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    final l10n = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: _currentIndex,
              children: _tabs,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.0, 1.0],
                    colors: [
                      theme.colors.background,
                      theme.colors.onBackgroundLinear,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          backgroundColor: theme.colors.background,
          selectedItemColor: theme.colors.primary,
          unselectedItemColor: theme.colors.onSurcafe,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: Spacing.xLarge,
          ),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home_rounded,
              ),
              title: Text(
                l10n.homeLabelInBottomNav,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.bookmark_rounded,
              ),
              title: Text(
                l10n.bookmarkLabelInBottomNav,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.settings_rounded,
              ),
              title: Text(
                l10n.settingsLabelInBottomNav,
              ),
            ),
          ],
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
