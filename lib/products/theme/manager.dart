import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shorten_app/core/constants/enums/hive_enum.dart';
import 'package:shorten_app/core/constants/enums/theme_enum.dart';
import 'package:shorten_app/products/theme/app_themes.dart';

import 'app_theme.dart';

final themeRiverpod = ChangeNotifierProvider((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    isLightThemeFunc();
  }
  bool isLightTheme = true;

  Future<void> isLightThemeFunc() async {
    if (await getUserSelectedTheme() != AppTheme.DARK.rawValue()) {
      isLightTheme = true;
    } else {
      isLightTheme = false;
    }
    notifyListeners();
  }

  Future<ITheme> get theme async {
    switch (await currentTheme) {
      case 'Dark':
        return AppThemeDark();
      case 'Light':
        return AppThemeLight();
      default:
        return AppThemeLight();
    }
  }

  Future<void> saveCurrentTheme(String currentTheme) async {
    await Hive.openBox(HiveBoxKey.themeKey.name); //buradaki theme hivekey
    var theme = Hive.box(HiveBoxKey.themeKey.name);
    await theme.put(HiveBoxKey.themeKey.name, currentTheme);
    isLightTheme = currentTheme == AppTheme.LIGHT.rawValue() ? true : false;
    notifyListeners();
  }

  Future<String> get currentTheme async {
    return await getUserSelectedTheme();
  }

  Future<String> getUserSelectedTheme() async {
    await Hive.openBox(HiveBoxKey.themeKey.name);
    var theme = Hive.box(HiveBoxKey.themeKey.name);
    var userCurrentTheme = await theme.get(HiveBoxKey.themeKey.name);
    if (userCurrentTheme != null) {
      return userCurrentTheme;
    } else {
      await theme.put(HiveBoxKey.themeKey.name, currentTheme);
      return AppTheme.LIGHT.rawValue(); //veya burda default ligththeme de olur
    }
  }

  Future<void> changeAppTheme(String themes) async {
    //final _theme = await getUserSelectedTheme();
    switch (themes) {
      case 'Dark':
        await saveCurrentTheme(AppTheme.DARK.rawValue());
        break;
      case 'Light':
        await saveCurrentTheme(AppTheme.LIGHT.rawValue());
        break;
      default:
    }

    notifyListeners();
  }
}
