import 'package:domain_models/domain_models.dart';
import 'package:key_value_storage/key_value_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:settings_repository/src/mappers/cache_to_domain.dart';
import 'package:settings_repository/src/mappers/domain_to_cache.dart';
import 'package:settings_repository/src/settings_local_storage.dart';

class SettingsRepository {
  SettingsRepository({
    required KeyValueStorage keyValueStorage,
    SettingsLocalStorage? localStorage,
  }) : _localStorage = localStorage ??
            SettingsLocalStorage(
              keyValueStorage: keyValueStorage,
            );

  final SettingsLocalStorage _localStorage;
  final BehaviorSubject<DarkModePreference> _darkModePreferenceSubject =
      BehaviorSubject();
  final BehaviorSubject<LanguagePreference> _languagePreferenceSubject =
      BehaviorSubject();

  Future<void> upsertDarkModePreference(DarkModePreference preference) async {
    await _localStorage.upsertDarkModePreference(
      preference.toCacheModel(),
    );
    _darkModePreferenceSubject.add(preference);
  }

  Stream<DarkModePreference> getDarkModePreference() async* {
    if (!_darkModePreferenceSubject.hasValue) {
      final storagePreference = await _localStorage.getDarkModePreference();
      _darkModePreferenceSubject.add(
        storagePreference?.toDomainModel() ??
            DarkModePreference.useSystemSettings,
      );
    }
    yield* _darkModePreferenceSubject.stream;
  }

  Future<void> upsertLanguagePreference(LanguagePreference preference) async {
    await _localStorage.upsertLanguagePreference(
      preference.toCacheModel(),
    );
    _languagePreferenceSubject.add(preference);
  }

  Stream<LanguagePreference> getLanguagePreference() async* {
    if (!_languagePreferenceSubject.hasValue) {
      final storagePreference = await _localStorage.getLanguagePreference();
      _languagePreferenceSubject.add(
        storagePreference?.toDomainModel() ?? LanguagePreference.en,
      );
    }
    yield* _languagePreferenceSubject.stream;
  }
}
