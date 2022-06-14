part of 'color_themes.dart';

class DarkColors implements IColors {
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

  DarkColors() {
    brightness = Brightness.dark;
    switchBackgroundColor = colors.text;
    scaffoldBackgroundColor = colors.backgroundDark;
    iconColor = colors.mustard;
    overlayStyle = SystemUiOverlayStyle.dark;
    bottomNavbar = colors.backgroundDark;
    colorScheme = ColorScheme(
      primary: colors.orange, //x
      onBackground: colors.backgroundDark, //x
      onSecondary: colors.backgroundDark, //x
      error: colors.orange, //x
      onTertiary: colors.secondaryBlue, //x
      onPrimaryContainer: Colors.black, //x
      onPrimary: colors.background,
      onSurface: colors.orange,
      background: colors.dark2,
      onError: colors.secondaryBlue,
      secondary: colors.secondaryBlue,
      surface: colors.background,

      brightness: Brightness.dark,
    );
  }
}
