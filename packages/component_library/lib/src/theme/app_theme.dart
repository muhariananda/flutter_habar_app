import 'package:component_library/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class NewsTheme extends InheritedWidget {
  const NewsTheme({
    required super.child,
    required this.lighTheme,
    required this.darkTheme,
    super.key,
  });

  final AppThemeData lighTheme;
  final AppThemeData darkTheme;

  static AppThemeData? of(BuildContext context) {
    final inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<NewsTheme>();

    assert(inheritedTheme != null, 'No AppTheme found in context');

    final currentBrightness = Theme.of(context).brightness;

    return currentBrightness == Brightness.dark
        ? inheritedTheme!.darkTheme
        : inheritedTheme!.lighTheme;
  }

  @override
  bool updateShouldNotify(NewsTheme oldWidget) =>
      oldWidget.lighTheme != lighTheme || oldWidget.darkTheme != darkTheme;
}
