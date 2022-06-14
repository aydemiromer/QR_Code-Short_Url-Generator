enum AppTheme { DARK, LIGHT }

extension AppThemeExtension on AppTheme {
  String rawValue() {
    switch (this) {
      case AppTheme.DARK:
        return 'Dark';
      case AppTheme.LIGHT:
        return 'Light';
    }
  }
}
