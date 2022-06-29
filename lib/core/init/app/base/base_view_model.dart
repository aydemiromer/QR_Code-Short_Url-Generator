import 'package:flutter/material.dart';

import '../../network/vexana_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;
  VexanaManager? vexanaManager = VexanaManager.instance;
  VexanaManager get vexanaManagerComputed => VexanaManager.instance;
  void setContext(BuildContext context);
  void init();
}
