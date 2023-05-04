import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'news_list_localizations_en.dart';
import 'news_list_localizations_id.dart';

/// Callers can lookup localized strings with an instance of NewsListLocalizations
/// returned by `NewsListLocalizations.of(context)`.
///
/// Applications need to include `NewsListLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/news_list_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: NewsListLocalizations.localizationsDelegates,
///   supportedLocales: NewsListLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the NewsListLocalizations.supportedLocales
/// property.
abstract class NewsListLocalizations {
  NewsListLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static NewsListLocalizations of(BuildContext context) {
    return Localizations.of<NewsListLocalizations>(
        context, NewsListLocalizations)!;
  }

  static const LocalizationsDelegate<NewsListLocalizations> delegate =
      _NewsListLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @newsListRefreshErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t refresh your items.\nPlease, check your internet connection and try again later.'**
  String get newsListRefreshErrorMessage;

  /// No description provided for @listHeader.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Headlines'**
  String get listHeader;

  /// No description provided for @listSubHeader.
  ///
  /// In en, this message translates to:
  /// **'Latest news across categories'**
  String get listSubHeader;

  /// No description provided for @allLabel.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allLabel;

  /// No description provided for @businessLabel.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get businessLabel;

  /// No description provided for @healthLabel.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get healthLabel;

  /// No description provided for @scienceLabel.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get scienceLabel;

  /// No description provided for @sportsLabel.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sportsLabel;

  /// No description provided for @technologyLabel.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technologyLabel;

  /// No description provided for @entertainmentLabel.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get entertainmentLabel;
}

class _NewsListLocalizationsDelegate
    extends LocalizationsDelegate<NewsListLocalizations> {
  const _NewsListLocalizationsDelegate();

  @override
  Future<NewsListLocalizations> load(Locale locale) {
    return SynchronousFuture<NewsListLocalizations>(
        lookupNewsListLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_NewsListLocalizationsDelegate old) => false;
}

NewsListLocalizations lookupNewsListLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return NewsListLocalizationsEn();
    case 'id':
      return NewsListLocalizationsId();
  }

  throw FlutterError(
      'NewsListLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
