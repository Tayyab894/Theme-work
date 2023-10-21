import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool is_dark_theme = true;

  bool get getThemeStatus {
    return is_dark_theme;
  }

  void SetThemeStatus(bool isDarkTheme) async{
    is_dark_theme = isDarkTheme;

final prefs = await SharedPreferences.getInstance();
await prefs.setBool("is_dark_theme", is_dark_theme);
    notifyListeners();
  }
}
