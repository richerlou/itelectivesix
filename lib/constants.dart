import 'package:flutter/material.dart';

const shopeeColor = Color(0xffee4d2d);
const gradPurple = Color(0xFF7655ca);
const gradPink = Color(0xFFca55bc);
const gradYellow = Color(0xFFffcb71);
const fbBlue = Color(0xff4667AC);
const xingGreen = Color(0xff00575c);
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
