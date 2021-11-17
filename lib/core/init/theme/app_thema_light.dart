import 'package:flutter/material.dart';
import 'package:tekrar/core/init/theme/app_theme.dart';
import 'package:tekrar/core/init/theme/light/theme_light_interface.dart';

class AppThemeLight extends AppThema with ILightTheme {
  static AppThemeLight? _instace;
  static AppThemeLight get instance {
    _instace ??= AppThemeLight._init();
    return _instace!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              color: Colors.transparent,
              elevation: 0,
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.black87, size: 21),
            ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.black,
          hoverColor: Colors.black,
          filled: true,
          fillColor: Colors.white,
          //contentPadding: EdgeInsets.only(left: 5),
          labelStyle: TextStyle(color: Colors.black, fontSize: 12),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
          border: OutlineInputBorder(
              //borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
            width: 0.3,
          )),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
        ),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(onError: Color(0xffFF2D55)),
            ),
      );

  TextTheme textTheme() => TextTheme(
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
        headline1: textThemeLight.headline1,
        headline2: textThemeLight.headline2,
        headline3: textThemeLight.headline3,
        headline4: textThemeLight.headline4,
        headline5: textThemeLight.headline5,
        headline6: textThemeLight.headline6,
      );

  ColorScheme get appColorScheme {
    return ColorScheme(
      primary: colorSchemeLight.brown,
      primaryVariant: Colors.white,
      secondary: Colors.green,
      secondaryVariant: Colors.green.shade100,
      surface: Color(0xffffc93c),
      background: Color(0xfff6f9fc),
      error: Colors.cyan,
      onPrimary: Colors.blue, //*
      onSecondary: Colors.black,
      onSurface: Colors.white30,
      onBackground: Colors.black12,
      onError: Colors.orange,
      brightness: Brightness.light,
    );
  }
}
