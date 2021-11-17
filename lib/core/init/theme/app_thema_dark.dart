import 'package:flutter/material.dart';
import 'package:tekrar/core/init/theme/app_theme.dart';
import 'package:tekrar/core/init/theme/dark/theme_dark_interface.dart';

class AppThemeDark extends AppThema with IDarkTheme {
  static AppThemeDark? _instace;
  static AppThemeDark get instance {
    _instace ??= AppThemeDark._init();
    return _instace!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        textTheme: TextTheme(
          headline6: textThemeDark.headline6,
        ),
      );
}
