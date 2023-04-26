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
}
