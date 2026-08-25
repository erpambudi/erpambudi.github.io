import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferences _prefs;
  static const _kThemeKey = 'app_theme_mode';

  ThemeCubit({required SharedPreferences prefs})
    : _prefs = prefs,
      super(_loadInitialTheme(prefs));

  static ThemeMode _loadInitialTheme(SharedPreferences prefs) {
    final val = prefs.getString(_kThemeKey);
    if (val == 'dark') return ThemeMode.dark;
    return ThemeMode.light; // Default to clean light mode
  }

  void toggleTheme() {
    if (state == ThemeMode.dark) {
      setTheme(ThemeMode.light);
    } else {
      setTheme(ThemeMode.dark);
    }
  }

  void setTheme(ThemeMode mode) {
    _prefs.setString(_kThemeKey, mode == ThemeMode.light ? 'light' : 'dark');
    emit(mode);
  }
}
