import 'package:notes_app/utils/colors.dart';
import 'package:flutter/material.dart';


class ThemeClass {
  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().primaryColor,
    scaffoldBackgroundColor: AppColors.aBgColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.aBgColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.aFabColor,
    ),
  );
}