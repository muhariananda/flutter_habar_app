part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInProgress extends SettingsState {
  const SettingsInProgress();
}

class SettingsLoaded extends SettingsState {
  const SettingsLoaded({
    this.darkModePreference = DarkModePreference.useSystemSettings,
    this.languagePreference = LanguagePreference.en,
  });

  final DarkModePreference darkModePreference;
  final LanguagePreference languagePreference;

  SettingsLoaded copyWith({
    DarkModePreference? darkModePreference,
    LanguagePreference? languagePreference,
  }) {
    return SettingsLoaded(
      darkModePreference: darkModePreference ?? this.darkModePreference,
      languagePreference: languagePreference ?? this.languagePreference,
    );
  }
}
