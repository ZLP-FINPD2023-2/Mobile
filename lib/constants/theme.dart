import 'package:flutter/material.dart';
import 'package:fin_app/constants/colors.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          //outline button text
          foregroundColor: lightColorScheme.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          // elevated button text
          foregroundColor: lightColorScheme.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)))),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: lightColorScheme.onSurface)),
  inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: lightColorScheme.outline),
      isDense: true,
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: lightColorScheme.outline)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: lightColorScheme.error)),
      focusColor: const Color(0xff1BD0B8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: lightColorScheme.outline)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: lightColorScheme.outline)),
      filled: true,
      fillColor: Colors.white),
  textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32,
          color: lightColorScheme.shadow,
          fontWeight: FontWeight.w700),
      bodyLarge: const TextStyle(fontSize: 16)),
);
