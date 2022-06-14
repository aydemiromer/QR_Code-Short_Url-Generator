import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
part 'dark_color.dart';

part 'light_color.dart';

@immutable
class _AppColors {
  final blue = const Color(0xffA8D5E2);
  final orange = const Color(0xffF9A620);
  final mustard = const Color(0xffFFD449);
  final secondaryBlue = const Color(0xff008fa1);
  final success = const Color(0xff5748C2F);
  final background = const Color(0xfff5f8ff);
  final backgroundDark = const Color(0xff1B2430);
  final dark2 = const Color(0xff51557E);
  final text = const Color(0xff001031);
  final error = const Color(0xffA91079);
}

abstract class IColors {
  _AppColors get colors;
  Color? scaffoldBackgroundColor;
  Color? iconColor;
  Color? bottomNavbar;
  Color? qrGenerate;
  SystemUiOverlayStyle? overlayStyle;
  ColorScheme? colorScheme;
  Brightness? brightness;
  Color? switchBackgroundColor;
}
