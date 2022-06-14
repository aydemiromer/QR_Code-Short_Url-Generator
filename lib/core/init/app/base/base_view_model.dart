import 'package:flutter/material.dart';

import '../../network/vexana_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;

  // ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
  VexanaManager? vexanaManager = VexanaManager.instance;

  VexanaManager get vexanaManagerComputed => VexanaManager.instance;

  /*LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;*/

  void setContext(BuildContext context);
  void init();
}
