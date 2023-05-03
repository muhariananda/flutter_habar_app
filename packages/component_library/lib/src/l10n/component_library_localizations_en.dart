import 'component_library_localizations.dart';

/// The translations for English (`en`).
class ComponentLibraryLocalizationsEn extends ComponentLibraryLocalizations {
  ComponentLibraryLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emptyItemsMessage => 'You don\'t have bookmarks yet';

  @override
  String get emptyResultTitle => 'No news found';

  @override
  String get emptyResultMessage => 'Please look for another search.';

  @override
  String get exceptionIndicatorTitle => 'Opps there is something wrong';

  @override
  String get exceptionIndicatorMessage => 'There is a problem with the app, please try again later.';

  @override
  String get tryAgainLabel => 'Try again';

  @override
  String get searchHintText => 'Search';
}
