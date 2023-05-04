import 'package:domain_models/domain_models.dart';
import 'package:key_value_storage/key_value_storage.dart';

extension DarkModePreferenceToCM on DarkModePreference {
  DarkModePreferenceCM toCacheModel() {
    switch (this) {
      case DarkModePreference.alwaysDark:
        return DarkModePreferenceCM.alwaysDark;
      case DarkModePreference.alwaysLight:
        return DarkModePreferenceCM.alwaysLight;
      case DarkModePreference.useSystemSettings:
        return DarkModePreferenceCM.accordingToSystemPrefences;
    }
  }
}

extension LanguagePreferenceToCM on LanguagePreference {
  LanguagePreferenceCM toCacheModel() {
    switch (this) {
      case LanguagePreference.en:
        return LanguagePreferenceCM.en;
      case LanguagePreference.id:
        return LanguagePreferenceCM.id;
    }
  }
}
