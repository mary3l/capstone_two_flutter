import 'package:flutter/material.dart';

class AppFonts {
  static const String jersey10 = 'Jersey10';
  static const String inter = 'Inter';

  static TextStyle jersey10Style({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: jersey10,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle interStyle({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: inter,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
