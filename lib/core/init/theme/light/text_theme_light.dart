import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight get instance {
    _instace ??= TextThemeLight._init();
    return _instace!;
  }

  TextThemeLight._init();
  final TextStyle headline1 = TextStyle(fontSize: 95, fontWeight: FontWeight.w300, letterSpacing: -1.5, color: Colors.black);
  final TextStyle headline2 = TextStyle(fontSize: 59, fontWeight: FontWeight.w300, letterSpacing: -0.5, color: Colors.black);
  final TextStyle headline3 = TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: Colors.black);
  final TextStyle headline4 = TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.black);
  final TextStyle headline5 = TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black);
  final TextStyle headline6 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: Colors.black);
}
