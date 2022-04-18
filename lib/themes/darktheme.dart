// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'appcolor.dart';

ThemeData dark_theme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: AppColor.bodyColorDark,
  scaffoldBackgroundColor: AppColor.bodyColorDark,
  hintColor: AppColor.textColor,
  primaryColorLight: AppColor.buttonBackgroundColorDark,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.white,
  ),
);
