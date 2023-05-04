import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_news_app/app_route.dart';
import 'package:flutter_news_app/l10n/app_localizations.dart';
import 'package:key_value_storage/key_value_storage.dart';
import 'package:news_api/news_api.dart';
import 'package:news_detail/news_detail.dart';
import 'package:news_list/news_list.dart';
import 'package:news_repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:settings/settings.dart';
import 'package:settings_repository/settings_repository.dart';

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

  late final _settingsRepository = SettingsRepository(
    keyValueStorage: _keyValueStorage,
  );

  late final _routes = buildAppRoutes(
    newsRepository: _newsRepository,
    settingsRepository: _settingsRepository,
  );

  final _lightTheme = LightAppThemeData();
  final _darkTheme = DarkAppThemeData();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Rx.combineLatest2(
        _settingsRepository.getDarkModePreference(),
        _settingsRepository.getLanguagePreference(),
        (darkModePreference, languagePreference) => [
          darkModePreference,
          languagePreference,
        ],
      ),
      builder: (context, snapshot) {
        final darkModePreference = snapshot.data?[0] as DarkModePreference?;
        final languagePreference = snapshot.data?[1] as LanguagePreference?;
        return NewsTheme(
          lighTheme: _lightTheme,
          darkTheme: _darkTheme,
          child: MaterialApp(
            theme: _lightTheme.materialThemeData,
            darkTheme: _darkTheme.materialThemeData,
            themeMode: darkModePreference?.toThemeMode(),
            routes: _routes,
            locale: languagePreference?.toLocale(),
            supportedLocales: const [
              Locale('en'),
              Locale('id'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
              ComponentLibraryLocalizations.delegate,
              NewsListLocalizations.delegate,
              NewsDetailLocalizations.delegate,
              SettingsLocalizations.delegate,
            ],
          ),
        );
      },
    );
  }
}

extension on DarkModePreference {
  ThemeMode toThemeMode() {
    switch (this) {
      case DarkModePreference.alwaysDark:
        return ThemeMode.dark;
      case DarkModePreference.alwaysLight:
        return ThemeMode.light;
      case DarkModePreference.useSystemSettings:
        return ThemeMode.system;
    }
  }
}

extension on LanguagePreference {
  Locale toLocale() {
    switch (this) {
      case LanguagePreference.en:
        return const Locale('en');
      case LanguagePreference.id:
        return const Locale('id');
    }
  }
}
