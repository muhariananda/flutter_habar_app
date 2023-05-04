import 'news_list_localizations.dart';

/// The translations for English (`en`).
class NewsListLocalizationsEn extends NewsListLocalizations {
  NewsListLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get newsListRefreshErrorMessage =>
      'We couldn\'t refresh your items.\nPlease, check your internet connection and try again later.';

  @override
  String get listHeader => 'Today\'s Headlines';

  @override
  String get listSubHeader => 'Latest news across categories';

  @override
  String get allLabel => 'All';

  @override
  String get businessLabel => 'Business';

  @override
  String get healthLabel => 'Health';

  @override
  String get scienceLabel => 'Science';

  @override
  String get sportsLabel => 'Sports';

  @override
  String get technologyLabel => 'Technology';

  @override
  String get entertainmentLabel => 'Entertainment';
}
