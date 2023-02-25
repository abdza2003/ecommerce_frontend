import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    // theme mode
    brightness: Brightness.light,
    // primary color
    primaryColor: ColorManager.primary,
    // appbar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: FontManager.boldStyle,
    ),
    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        minimumSize: Size(20, 30),
        textStyle: FontManager.boldStyle,
        padding: const EdgeInsets.all(15),
        shadowColor: ColorManager.silver.withOpacity(.4),
        backgroundColor: ColorManager.primaryGradation2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 10,
      shadowColor: ColorManager.silver.withOpacity(.4),
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: const EdgeInsets.all(10),
      hintStyle: FontManager.mediumStyle,
      labelStyle: FontManager.mediumStyle,
      fillColor: Colors.white60,
      filled: true,

      /// enabled border
      enabledBorder: OutlineInputBorder(
        // gapPadding: 30,
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ColorManager.silver.withOpacity(.4),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        // gapPadding: 30,
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ColorManager.silver.withOpacity(.4),
        ),
      ),
    ),
  );
}
