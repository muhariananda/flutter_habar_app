import 'package:hive/hive.dart';

part 'language_preference_cm.g.dart';

@HiveType(typeId: 5)
enum LanguagePreferenceCM {
  @HiveField(0)
  en,

  @HiveField(1)
  id,
}
