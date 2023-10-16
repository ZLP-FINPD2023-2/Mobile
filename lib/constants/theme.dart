import 'package:flutter/material.dart';
import 'package:fin_app/constants/colors.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xff94A3B8)),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff0F172A),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))),
  textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 32,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(fontSize: 14, color: Color(0xff6B7280), fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(fontSize: 16, color: Color(0xff6B7280)),
      bodySmall: TextStyle(fontSize: 14, color: Color(0xff6B7280)),
      labelLarge: TextStyle(fontSize: 16, color: Color(0xff0F172A)),
      labelMedium: TextStyle(fontSize: 14, color: Colors.white),
      labelSmall: TextStyle(fontSize: 14, color: Color(0xff0F172A))),
  inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: Color(0xff4B5563), fontSize: 14, fontWeight: FontWeight.w400),
      hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff94A3B8)),
      isDense: true,
      focusColor: const Color(0xff1BD0B8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Color(0xffCBD5E1))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Color(0xff94A3B8))),
      filled: true,
      fillColor: Colors.white),
);
