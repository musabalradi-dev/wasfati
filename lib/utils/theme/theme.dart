import 'package:flutter/material.dart';
import 'package:wasfati/utils/constants/colors.dart';
import 'package:wasfati/utils/theme/custom_theme/app_bar_theme.dart';
import 'package:wasfati/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:wasfati/utils/theme/custom_theme/input_decoration_theme.dart';
import 'package:wasfati/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:wasfati/utils/theme/custom_theme/text_theme.dart';

class MyThemeApp {
  MyThemeApp._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    colorSchemeSeed: MyColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.lightTextTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    iconTheme: IconThemeData(color: MyColors.black),
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MyInputDecorationTheme.lightInputDecorationTheme,
  );

  // dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    colorSchemeSeed: MyColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.darkTextTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    iconTheme: IconThemeData(color: MyColors.white),
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyInputDecorationTheme.darkInputDecorationTheme,
  );
}
