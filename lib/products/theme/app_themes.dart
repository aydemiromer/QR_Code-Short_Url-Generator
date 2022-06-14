import 'package:shorten_app/products/theme/text/dark_text.dart';
import 'package:shorten_app/products/theme/text/light_text.dart';
import 'package:shorten_app/products/theme/text/text_theme.dart';

import 'app_theme.dart';
import 'colors/color_themes.dart';

class AppThemeLight extends ITheme {
  @override
  late final ITextTheme textTheme;
  final String _fontFamily = "Roboto";
  AppThemeLight() {
    textTheme = TextThemeLight(colors.colors.text, _fontFamily, colorTheme: colors);
  }

  @override
  IColors get colors => LightColors();
}

class AppThemeDark extends ITheme {
  @override
  late final ITextTheme textTheme;
  final String _fontFamily = "Roboto";

  AppThemeDark() {
    textTheme = TextThemeDark(colors.colors.background, _fontFamily, colorTheme: colors);
  }

  @override
  IColors get colors => DarkColors();
}
