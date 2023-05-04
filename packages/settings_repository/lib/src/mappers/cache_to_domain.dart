import 'package:domain_models/domain_models.dart';
import 'package:key_value_storage/key_value_storage.dart';

extension DarkModePreferenceCMtoDomain on DarkModePreferenceCM {
  DarkModePreference toDomainModel() {
    switch (this) {
      case DarkModePreferenceCM.alwaysDark:
        return DarkModePreference.alwaysDark;
      case DarkModePreferenceCM.alwaysLight:
        return DarkModePreference.alwaysLight;
      case DarkModePreferenceCM.accordingToSystemPrefences:
        return DarkModePreference.useSystemSettings;
    }
  }
}

extension LanguagePreferenceCMtoDomain on LanguagePreferenceCM {
  LanguagePreference toDomainModel() {
    switch (this) {
      case LanguagePreferenceCM.en:
        return LanguagePreference.en;
      case LanguagePreferenceCM.id:
        return LanguagePreference.id;
    }
  }
}
