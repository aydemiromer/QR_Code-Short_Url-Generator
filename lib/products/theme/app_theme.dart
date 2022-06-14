import 'package:flutter/material.dart';
import 'package:shorten_app/products/theme/text/text_theme.dart';

import 'colors/color_themes.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColors get colors;
}

abstract class ThemeManager {
  static ThemeData createTheme(ITheme theme) => ThemeData(
        fontFamily: theme.textTheme.fontFamily,
        textTheme: theme.textTheme.data,
        primaryColorLight: theme.colors.iconColor,
        brightness: theme.colors.colorScheme?.brightness,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                onPrimary: theme.colors.colorScheme?.background)),
        inputDecorationTheme: _inputDecoration(theme),
        scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
        colorScheme: theme.colors.colorScheme,
        switchTheme: SwitchThemeData(
            thumbColor:
                MaterialStateProperty.all(theme.colors.switchBackgroundColor)),
      );

  static InputDecorationTheme _inputDecoration(ITheme theme) {
    return InputDecorationTheme(
        labelStyle: theme.textTheme.subtitle2,
        fillColor: theme.colors.colors.secondaryBlue.withOpacity(0.7),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ));
  }
}
