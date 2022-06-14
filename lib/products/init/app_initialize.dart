import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shorten_app/products/hive/hive_manager.dart';

import '../model/modelim.dart';
import 'localization_initialize.dart';

class ApplicationInitialze {
  late final LocalizationInitialze localization;

  ApplicationInitialze() {
    WidgetsFlutterBinding.ensureInitialized();
    Hive.registerAdapter(MyListAdapter());
    Hive.registerAdapter(ThemeModelAdapter());
    localization = LocalizationInitialze();
  }
  Future<void> start() async {
    await EasyLocalization.ensureInitialized();
    await Hive.initFlutter();
    ManageHive().init();

    EasyLocalization.logger.enableBuildModes = [];
  }
}
