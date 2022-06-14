import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shorten_app/products/init/app_initialize.dart';
import 'package:shorten_app/products/theme/app_theme.dart';
import 'package:shorten_app/products/theme/app_themes.dart';
import 'package:shorten_app/products/theme/manager.dart';
import 'package:shorten_app/view/home_page.dart';

void main() async {
  final _applicationInit = ApplicationInitialze();
  await _applicationInit.start();

  runApp(ProviderScope(
    child: EasyLocalization(
        startLocale: _applicationInit.localization.initialLocale,
        supportedLocales: _applicationInit.localization.supportedLocales,
        path: _applicationInit.localization.assetPath, // <-- change the path of the translation files
        fallbackLocale: _applicationInit.localization.initialLocale,
        child: const MyApp()),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeChange = ref.watch(themeRiverpod);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        title: 'Shorten App',
        theme: ThemeManager.createTheme(themeChange.isLightTheme == true ? AppThemeLight() : AppThemeDark()),
        home: const HomePage());
  }
}
