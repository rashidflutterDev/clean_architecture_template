import 'package:clean_architecture_template/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 3,
          color: color,
        ),
      );
  // static ThemeData lightTheme = ThemeData(
  //   brightness: Brightness.light,
  //   useMaterial3: true,
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: const Color.fromARGB(255, 18, 17, 17),
  //     brightness: Brightness.light,
  //   ),
  // );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(24),
        enabledBorder: _border(Pallete.borderColor),
        focusedBorder: _border(Pallete.gradient3),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 18, 17, 17),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Pallete.backgroundColor));
}
