import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:flutter/material.dart';

class FontManager {
  static TextStyle get boldStyle {
    return TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: ColorManager.primary,
    );
  }

  static TextStyle get semiBoldStyle {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorManager.primary,
    );
  }

  static TextStyle get mediumStyle {
    return TextStyle(
      fontSize: 16,
      color: ColorManager.primaryGradation1,
    );
  }
}
