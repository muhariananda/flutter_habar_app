import 'news_detail_localizations.dart';

/// The translations for English (`en`).
class NewsDetailLocalizationsEn extends NewsDetailLocalizations {
  NewsDetailLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get bookmarkedMessage => 'News has been added to the bookmark list';

  @override
  String get unbookmarkMessage => 'News has been removed to the bookmark list';
}
