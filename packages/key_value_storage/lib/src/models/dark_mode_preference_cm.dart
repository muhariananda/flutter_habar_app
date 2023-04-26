import 'package:hive/hive.dart';

part 'dark_mode_preference_cm.g.dart';

@HiveType(typeId: 4)
enum DarkModePreferenceCM {
  @HiveField(0)
  alwaysDark,

  @HiveField(1)
  alwaysLight,

  @HiveField(2)
  accordingToSystemPrefences
}
