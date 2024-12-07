import 'package:flutter/material.dart';

class AppColors {
  //primary colors
  static const Color aFabColor = Color.fromARGB(255, 204, 17, 237);
  static Color aBgColor = const Color(0xff202326);
  static Color aCardColor = const Color(0xff2F3235);
  static Color aWhiteColor = const Color.fromARGB(255, 255, 255, 255);

  //gradient colors
  static const int gradientStart = 0XFF01F0FF;
  static const int gradientEnd = 0XFF4441ED;
  LinearGradient aPrimaryGradient = const LinearGradient(
    colors: <Color>[
      Color(gradientStart),
      Color(gradientEnd),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}