import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/consts/app_colors.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkTheme
            ? const Color.fromARGB(255, 9, 3, 9)
            : AppColors.lightScaffoldColor,
        cardColor: isDarkTheme
            ? const Color.fromARGB(255, 2, 1, 5)
            : AppColors.lightCardColor,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(
          iconTheme:
              IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
          backgroundColor: isDarkTheme
              ? AppColors.darkScaffoldColor
              : AppColors.lightScaffoldColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          errorBorder: OutlineInputBorder(
            // when user enter invalid info this border helps
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.error,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // focused on the error texts
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.error,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ));
  }
}
