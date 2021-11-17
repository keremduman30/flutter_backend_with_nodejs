import 'package:tekrar/core/init/theme/light/color_scheme_light.dart';
import 'package:tekrar/core/init/theme/light/text_theme_light.dart';

abstract class ILightTheme{
  TextThemeLight get textThemeLight=>TextThemeLight.instance;
  ColorSchemeLight get colorSchemeLight=>ColorSchemeLight.instance;
} 