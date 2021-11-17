import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tekrar/core/constant/enum/app_thema_enum.dart';
import 'package:tekrar/core/init/theme/app_thema_light.dart';

class ThemeNotifier extends ChangeNotifier {
  AppThemeEnum _appThemes = AppThemeEnum.LIGHT;
  AppThemeEnum get appThemes => _appThemes;
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemeEnum theme) {
    if (theme == AppThemeEnum.LIGHT) {
      _currentTheme = AppThemeLight.instance.theme;
      _appThemes = AppThemeEnum.LIGHT;
    } else {
      _currentTheme = ThemeData.dark();
      _appThemes = AppThemeEnum.DARK;
    }

    notifyListeners();
  }
}

/*
 AppThemeEnum _appThemes = AppThemeEnum.LIGHT;
  AppThemeEnum get appThemes => _appThemes;
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemeEnum theme) {
    if (theme == AppThemeEnum.LIGHT) {
      _currentTheme = AppThemeLight.instance.theme;
      _appThemes = AppThemeEnum.LIGHT;
    } else {
      _currentTheme = ThemeData.dark();
      _appThemes = AppThemeEnum.DARK;
    }

    notifyListeners();
  }
 */