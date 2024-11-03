
import 'package:education_app/utils/constants.dart';
import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade100,
    secondary: Colors.white,
    onPrimary: Constants.themeColor,
    onSecondary: Constants.subThemeColor,
  ),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade900,
    secondary: Colors.black,
    onPrimary: Constants.themeColor,
    onSecondary: Constants.subThemeColor,
  ),
);
