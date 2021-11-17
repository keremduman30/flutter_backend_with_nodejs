import 'package:flutter/cupertino.dart';

class LanguageManager {
  static LanguageManager? _instace;
  static LanguageManager get instance {
    _instace ??= LanguageManager._init();
    return _instace!;
  }

  LanguageManager._init();
  final trLocale = const Locale("tr", "TR");
  final enLocale = const Locale("en", "US");
  List<Locale> get supportLocale => [trLocale, enLocale];
}
