import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary => const Color(0xFF3498DB);

  Color get onPrimary => Colors.white;

  Color get background;

  Color get surface;

  Color get onBackground;

  Color get onBackgroundLinear;

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

  @override
  Color get onBackgroundLinear => const Color.fromARGB(0, 255, 255, 255);
}

class DarkColors extends AppColors {
  @override
  Color get background => Colors.black;

  @override
  Color get onBackground => Colors.white;

  @override
  Color get onSurcafe => const Color(0xFF7E7E7E);

  @override
  Color get surface => const Color(0xFF1D1D1D);

  @override
  Color get onBackgroundLinear => Colors.transparent;
}
