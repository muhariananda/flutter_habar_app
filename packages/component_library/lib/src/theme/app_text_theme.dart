import 'package:component_library/src/theme/app_colors.dart';
import 'package:component_library/src/theme/font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static final _lightColors = LightColors();

  static final light = TextTheme(
    titleLarge: GoogleFonts.inter(
      fontSize: FontSize.large,
      fontWeight: FontWeight.w600,
      color: _lightColors.onBackground,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: FontSize.mediumLarger,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: _lightColors.onBackground,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: FontSize.medium,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: _lightColors.onBackground,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: FontSize.medium,
      fontWeight: FontWeight.w600,
      color: _lightColors.onSurcafe,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: FontSize.xSmall,
      fontWeight: FontWeight.w600,
      color: _lightColors.onSurcafe,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: FontSize.small,
      fontWeight: FontWeight.w600,
      color: _lightColors.onSurcafe,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: FontSize.xSmall,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: _lightColors.onBackground,
    ),
  );

  static final _darkColors = DarkColors();

  static final dark = TextTheme(
    titleLarge: GoogleFonts.inter(
      fontSize: FontSize.large,
      fontWeight: FontWeight.w600,
      color: _darkColors.onBackground,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: FontSize.mediumLarger,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: _darkColors.onBackground,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: FontSize.medium,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: _darkColors.onBackground,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: FontSize.medium,
      fontWeight: FontWeight.w600,
      color: _darkColors.onSurcafe,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: FontSize.xSmall,
      fontWeight: FontWeight.w600,
      color: _darkColors.onSurcafe,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: FontSize.small,
      fontWeight: FontWeight.w600,
      color: _darkColors.onSurcafe,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: FontSize.xSmall,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: _darkColors.onBackground,
    ),
  );
}
