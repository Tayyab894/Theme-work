import 'package:flutter/material.dart';
import 'package:task_one/theme_data/theme_colors.dart';
import 'package:task_one/theme_data/theme_texts.dart';

class ThemeLight {
  ThemeLight._();

  static ThemeData light_theme = ThemeData(
      backgroundColor: ThemeColors.backgroundColor_lt,
      appBarTheme: appbar_theme,
      textTheme: ThemeTexts.text_theme_lt,
      iconTheme: icon_theme_data 
      );

  static AppBarTheme appbar_theme = AppBarTheme(
      backgroundColor: ThemeColors.appbar_backgroundColor_lt,
      titleTextStyle: TextStyle(fontSize: 25, color: Colors.white));

  // static TextTheme text_theme = TextTheme(
  //     headline1: TextStyle(
  //         fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700));

  static IconThemeData icon_theme_data = IconThemeData(
      color: Colors.black , size: 60
  );
}
