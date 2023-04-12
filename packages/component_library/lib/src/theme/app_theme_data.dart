import 'package:component_library/src/theme/app_colors.dart';
import 'package:component_library/src/theme/app_text_theme.dart';
import 'package:component_library/src/theme/spacing.dart';
import 'package:flutter/material.dart';

const _dividerThemeData = DividerThemeData(
  space: 0,
);

abstract class AppThemeData {
  AppColors get colors;

  ThemeData get materialThemeData;

  double screenMargin = Spacing.mediumLarge;

  Color get roundedChoiceChipBackgroundColor;

  Color get roundedChoiceSelectedChipBackground => colors.primary;

  Color get roundedChoiceChipLabelColor;

  Color get roundedChoiceSelectedChipLabelColor => colors.onPrimary;

  Color get searchBarBackgroudColor;

  Color get searchBarLabelColor;

  TextTheme get text;
}

class LightAppThemeData extends AppThemeData {
  @override
  AppColors get colors => LightColors();

  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.light,
        textTheme: text,
        dividerTheme: _dividerThemeData,
        primarySwatch: colors.primary.toMaterialColor(),
        scaffoldBackgroundColor: colors.background,
      );

  @override
  Color get roundedChoiceChipBackgroundColor => colors.surface;

  @override
  Color get roundedChoiceChipLabelColor => colors.onSurcafe;

  @override
  Color get searchBarBackgroudColor => colors.surface;

  @override
  Color get searchBarLabelColor => colors.onSurcafe;

  @override
  TextTheme get text => AppTextTheme.light;
}

class DarkAppThemeData extends AppThemeData {
  @override
  AppColors get colors => DarkColors();

  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.dark,
        textTheme: text,
        dividerTheme: _dividerThemeData,
        primarySwatch: colors.primary.toMaterialColor(),
        scaffoldBackgroundColor: colors.background,
      );

  @override
  Color get roundedChoiceChipBackgroundColor => colors.surface;

  @override
  Color get roundedChoiceChipLabelColor => colors.onSurcafe;

  @override
  Color get searchBarBackgroudColor => colors.surface;

  @override
  Color get searchBarLabelColor => colors.onSurcafe;

  @override
  TextTheme get text => AppTextTheme.dark;
}

extension on Color {
  Map<int, Color> _toSwatch() => {
        50: withOpacity(0.1),
        100: withOpacity(0.2),
        200: withOpacity(0.3),
        300: withOpacity(0.4),
        400: withOpacity(0.5),
        500: withOpacity(0.6),
        600: withOpacity(0.7),
        700: withOpacity(0.8),
        800: withOpacity(0.9),
        900: this,
      };

  MaterialColor toMaterialColor() => MaterialColor(
        value,
        _toSwatch(),
      );
}
