part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class SettingsStarted extends SettingsEvent {
  const SettingsStarted();
}

class SettingsDarkModePreferenceChanged extends SettingsEvent {
  const SettingsDarkModePreferenceChanged(
    this.preference,
  );

  final DarkModePreference preference;

  @override
  List<Object?> get props => [preference];
}

class SettingsLanguagePreferenceChanged extends SettingsEvent {
  const SettingsLanguagePreferenceChanged(
    this.preference,
  );

  final LanguagePreference preference;

  @override
  List<Object?> get props => [preference];
}
