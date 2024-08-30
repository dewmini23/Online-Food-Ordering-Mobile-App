import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/consts/app_colors.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
      ? const Color.fromARGB(255, 3, 1, 9)
      :AppColors.lightScaffoldColor,
      cardColor: isDarkTheme
      ? const Color.fromARGB(255, 2, 1, 5)
      : AppColors.lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light);
  
  }
}
