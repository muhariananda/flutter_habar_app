import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  final _lightTheme = LightAppThemeData();
  final _darkTheme = DarkAppThemeData();

  @override
  Widget build(BuildContext context) {
    return NewsTheme(
      lighTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: MaterialApp(
        theme: _lightTheme.materialThemeData,
        darkTheme: _darkTheme.materialThemeData,
      ),
    );
  }
}
