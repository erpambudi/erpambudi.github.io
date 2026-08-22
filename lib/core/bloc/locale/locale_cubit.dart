import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  final SharedPreferences _prefs;

  static const _kLocaleKey = 'app_locale';

  LocaleCubit({required SharedPreferences prefs})
    : _prefs = prefs,
      super(Locale(prefs.getString(_kLocaleKey) ?? 'id'));

  void changeLocale(Locale locale) {
    _prefs.setString(_kLocaleKey, locale.languageCode);
    emit(locale);
  }
}
