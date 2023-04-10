import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary => const Color(0xFF3498DB);

  Color get onPrimary => Colors.white;

  Color get background;

  Color get surface;

  Color get onBackground;

  Color get onSurcafe;
}

class LightColors extends AppColors {
  @override
  Color get background => Colors.white;

  @override
  Color get onBackground => const Color(0xFF2F3542);

  @override
  Color get onSurcafe => const Color(0xFFA4B0BE);

  @override
  Color get surface => const Color(0xFFF1F2F6);
}

class DarkColors extends AppColors {
  @override
  Color get background => Colors.black;

  @override
  Color get onBackground => Colors.white;

  @override
  Color get onSurcafe => const Color(0xFFA4B0BE);

  @override
  Color get surface => const Color(0xFF2F3542);
}
