import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF2CBCEF);
  static const primaryOption1 = Color(0xFF343673);
  static const Color green = Color(0xFF4CD964);
  static const white = Color(0xFFFFFFFF);
  static const buttonColor = Color(0xFFE1C699);
  static const lightBerge = Color(0xFFF5F5DC);
  static const normalBlack = Color(0xFF2E2E2E);
  static const fillColor = Color(0xFF282827);
  static const deepBlack = Color(0xFF010100);
  static const textGrey = Color(0xFFC5C5C5);
  static const red = Color(0xffEB5757);
  static const yellow = Color(0xffFAB513);
  static List<Color> primaryColorOptions = const [
    primary,
  ];
  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }
}
