part of 'color_themes.dart';

class LightColors implements IColors {
  @override
  final _AppColors colors = _AppColors();

  @override
  late final ColorScheme? colorScheme;

  @override
  late final Color? bottomNavbar;

  @override
  late final Color? iconColor;

  @override
  late final Color? qrGenerate;
  @override
  late final Color? scaffoldBackgroundColor;

  @override
  SystemUiOverlayStyle? overlayStyle;

  @override
  late final Brightness? brightness;

  @override
  Color? switchBackgroundColor;

  LightColors() {
    brightness = Brightness.light;
    scaffoldBackgroundColor = colors.background;
    bottomNavbar = colors.background;
    iconColor = colors.mustard;
    overlayStyle = SystemUiOverlayStyle.light;
    colorScheme = ColorScheme(
      primary: colors.orange, //x
      onBackground: colors.background, //x
      onSecondary: colors.mustard, //x
      error: colors.orange, //x
      onTertiary: colors.secondaryBlue, //x
      onPrimaryContainer: Colors.black, //x
      onPrimary: colors.text,
      onSurface: colors.blue,
      background: colors.background,
      onError: colors.error,
      secondary: colors.success,
      surface: colors.background,

      brightness: Brightness.light,
    );
  }
}
