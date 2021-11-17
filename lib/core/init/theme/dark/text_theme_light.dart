import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextThemeDark {
  static TextThemeDark? _instace;
  static TextThemeDark get instance {
    _instace ??= TextThemeDark._init();
    return _instace!;
  }

  TextThemeDark._init();
  final TextStyle headline1 = TextStyle(fontSize: 95, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline2 = TextStyle(fontSize: 59, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 = TextStyle(fontSize: 48, fontWeight: FontWeight.w400);
  final TextStyle headline4 = TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle headline5 = TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  final TextStyle headline6 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15);
}
