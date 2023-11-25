import 'package:flutter/material.dart';
import 'package:fin_app/constants/colors.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  appBarTheme: const AppBarTheme(color: Colors.transparent),
  navigationBarTheme:
      const NavigationBarThemeData(backgroundColor: Colors.transparent),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          // elevated button text
          foregroundColor: lightColorScheme.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)))),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: lightColorScheme.onSurface)),
  textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32,
          color: lightColorScheme.shadow,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontSize: 22,
          color: lightColorScheme.shadow,
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 22, color: Colors.white),
      bodyLarge: const TextStyle(fontSize: 16)),
);

InputDecoration authTheme = InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: textDark),
    hintStyle: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: grayColor),
    isDense: true,
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: grayColor)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: errorColor)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: grayColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: grayColor)),
    filled: true,
    fillColor: Colors.white);

InputDecoration homeTheme = InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: textGrayDark),
    hintStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: textGrayLight),
    isDense: true);
