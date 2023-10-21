import 'package:flutter/material.dart';
import 'package:task_one/theme_data/theme_colors.dart';
import 'package:task_one/theme_data/theme_texts.dart';

class ThemeDark {
  ThemeDark._();

  static ThemeData dark_theme = ThemeData(
    backgroundColor: ThemeColors.backgroundColor_dt,
    appBarTheme: appbar_theme,
    textTheme: ThemeTexts.text_theme_dt,
    iconTheme: icon_theme_data
  );

  static AppBarTheme appbar_theme =
      AppBarTheme(backgroundColor: ThemeColors.appbar_backgroundColor_dt
      , titleTextStyle: TextStyle(fontSize: 25, color: Colors.white));



    //  static TextTheme text_theme =
    //   TextTheme(headline1: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700));

static IconThemeData icon_theme_data = IconThemeData(
   color: Colors.white , size: 60
  );
}
