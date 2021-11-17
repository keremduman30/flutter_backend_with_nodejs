import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace!;
  }

  ColorSchemeLight._init();
  final Color brown = Color(0xffa87e6f);
  final Color red = Color(0xffc10e0e);
  final Color white = Color(0xffffffff);
}
