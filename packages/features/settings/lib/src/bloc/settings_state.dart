part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.darkModePreference = DarkModePreference.useSystemSettings,
    this.languagePreference = LanguagePreference.en,
  });

  final DarkModePreference darkModePreference;
  final LanguagePreference languagePreference;

  SettingsState copyWith({
    DarkModePreference? darkModePreference,
    LanguagePreference? languagePreference,
  }) {
    return SettingsState(
      darkModePreference: darkModePreference ?? this.darkModePreference,
      languagePreference: languagePreference ?? this.languagePreference,
    );
  }

  @override
  List<Object> get props => [
        darkModePreference,
        languagePreference,
      ];
}
