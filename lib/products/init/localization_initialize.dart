import 'dart:ui';

import 'package:shorten_app/products/model/localizes.dart';

class LocalizationInitialze {
  final List<Locale> supportedLocales = [
    Localizes.tr.value,
    Localizes.en.value
  ];

  final String assetPath = 'assets/lang';

  final Locale initialLocale = Localizes.tr.value;
}
