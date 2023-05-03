import 'settings_localizations.dart';

/// The translations for English (`en`).
class SettingsLocalizationsEn extends SettingsLocalizations {
  SettingsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get darkModePreferenceAlwaysDarkLabel => 'Always Dark';

  @override
  String get darkModePreferenceAlwaysLightLabel => 'Always Light';

  @override
  String get darkModePreferenceUseSystemSettingsLabel => 'Use System Settings';

  @override
  String get themeModeTitle => 'Theme mode options';

  @override
  String get languageTitle => 'Language options';
}
