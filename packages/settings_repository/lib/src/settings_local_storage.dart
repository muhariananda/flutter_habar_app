import 'package:key_value_storage/key_value_storage.dart';

class SettingsLocalStorage {
  SettingsLocalStorage({
    required this.keyValueStorage,
  });

  final KeyValueStorage keyValueStorage;

  Future<void> upsertDarkModePreference(
    DarkModePreferenceCM preference,
  ) async {
    final box = await keyValueStorage.darkModePreference;
    await box.put(0, preference);
  }

  Future<DarkModePreferenceCM?> getDarkModePreference() async {
    final box = await keyValueStorage.darkModePreference;
    return box.get(0);
  }
}
