import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color primary = Color(0xFF3CED78);
  static const primarySwatch = MaterialColor(0xFF3CED78, <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: Color(0xFF3CED78),
    600: Color(0xFF3949AB),
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(0xFF1A237E),
  });
  static const Color primaryDark = Color(0xFF00521C);
  static const Color secondary = Color(0xFFEDF2F6);

  static const Color primaryText = Color(0xFF2B333E);
  static const Color secondaryText = Color(0xFF5E7A90);
  static const Color tertiaryText = Color(0xFF9DB7CB);

  static const Color divider = Color(0xFFEDF2F6);

  static final Color shadow = Colors.grey.shade300;

  static const Color lightRed = Color(0xFFe60000);

  static const List<Color> userColors = <Color>[
    Color(0xFFF3FF90),
    Color(0xFFFFB1B1),
    Color(0xFFD8EFD3),
    Color(0xFFFD9B63),
    Color(0xFFF075AA),
    Color(0xFF83B4FF),
    Color(0xFFFF9EAA),
    Color(0xFF6DC5D1),
  ];
}
