import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app_route.dart';
import 'package:key_value_storage/key_value_storage.dart';
import 'package:news_api/news_api.dart';
import 'package:news_detail/news_detail.dart';
import 'package:news_list/news_list.dart';
import 'package:news_repository/news_repository.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  final _keyValueStorage = KeyValueStorage();
  final _newsApi = NewsApi();

  late final _newsRepository = NewsRepository(
    keyValueStorage: _keyValueStorage,
    remoteApi: _newsApi,
  );

  late final _route = configureRoutes(
    newsRepository: _newsRepository,
  );

  final _lightTheme = LightAppThemeData();
  final _darkTheme = DarkAppThemeData();

  @override
  Widget build(BuildContext context) {
    return NewsTheme(
      lighTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: MaterialApp.router(
        theme: _lightTheme.materialThemeData,
        darkTheme: _darkTheme.materialThemeData,
        routerDelegate: _route.routerDelegate,
        routeInformationParser: _route.routeInformationParser,
        supportedLocales: const [
          Locale('en', ''),
          Locale('id', ''),
        ],
        localizationsDelegates: const [
          ComponentLibraryLocalizations.delegate,
          NewsListLocalizations.delegate,
          NewsDetailLocalizations.delegate,
        ],
      ),
    );
  }
}
