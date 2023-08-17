import 'package:devlab_flutter/src/settings/settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yaru/yaru.dart';

final _settingsBox = Hive.box("settings");

Settings loadSettingsFromBox() {
  final settings = Settings(
      textEditorFontFamily: _settingsBox.get("textEditorFontFamily", defaultValue: 'Hack'),
      highContrast: _settingsBox.get("highContrast", defaultValue: false),
      textEditorFontSize: _settingsBox.get("textEditorFontSize", defaultValue: 18.0),
      textEditorTheme: _settingsBox.get("textEditorTheme", defaultValue: "vs2015"),
      textEditorWrap: _settingsBox.get("textEditorWrap", defaultValue: false),
      favorites: _settingsBox.get("favorites", defaultValue: <String>[]),
      themeMode: ThemeMode.values[_settingsBox.get("themeMode", defaultValue: 0)],
      yaruVariant: YaruVariant.values[_settingsBox.get("yaruVariant", defaultValue: 0)]);

  return settings;
}

class SettingsNotifer extends StateNotifier<Settings> {
  SettingsNotifer() : super(loadSettingsFromBox());

  void setThemeMode(ThemeMode themeMode) async {
    _settingsBox.put("themeMode", themeMode.index);
    state = state.copyWith(themeMode: themeMode);
  }

  void setTextEditorFontFamily(String fontFamily) {
    _settingsBox.put("textEditorFontFamily", fontFamily);
    state = state.copyWith(textEditorFontFamily: fontFamily);
  }

  void setTextEditorFontSize(double fontSize) {
    _settingsBox.put("textEditorFontSize", fontSize);
    state = state.copyWith(textEditorFontSize: fontSize);
  }

  void setTextEditorTheme(String theme) {
    _settingsBox.put("textEditorTheme", theme);
    state = state.copyWith(textEditorTheme: theme);
  }

  void setTextEditorWrap(bool wrap) {
    _settingsBox.put("textEditorWrap", wrap);
    state = state.copyWith(textEditorWrap: wrap);
  }

  void setTextEditorDisplayLineNumbers(bool displayLineNumbers) {
    _settingsBox.put("textEditorDisplayLineNumbers", displayLineNumbers);
    state = state.copyWith(textEditorDisplayLineNumbers: displayLineNumbers);
  }

  void setYaruVariant(YaruVariant variant) {
    _settingsBox.put("yaruVariant", variant.index);
    state = state.copyWith(yaruVariant: variant);
  }

  void setHighContrast(bool isHighContrast) {
    _settingsBox.put("highContrast", isHighContrast);
    state = state.copyWith(highContrast: isHighContrast);
  }

  void setLocale(BuildContext context, Locale locale) {
    context.setLocale(locale);
  }

  void addFavorite(String name) {
    final favorites = state.favorites;
    favorites.add(name);
    _settingsBox.put("favorites", favorites);
    state = state.copyWith(favorites: favorites);
  }

  void removeFavorite(String name) {
    final favorites = state.favorites;
    favorites.remove(name);
    _settingsBox.put("favorites", favorites);
    state = state.copyWith(favorites: favorites);
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifer, Settings>((ref) {
  return SettingsNotifer();
});

final buildInfoProvider = FutureProvider<String>((ref) async {
  final info = await PackageInfo.fromPlatform();

  return "${info.appName} - ${info.version}+${info.buildNumber}-${kDebugMode ? "DEBUG" : "RELEASE"}";
});
