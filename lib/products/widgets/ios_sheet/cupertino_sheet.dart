import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shorten_app/products/theme/manager.dart';

import '../../../core/constants/enums/theme_enum.dart';

// ignore: must_be_immutable
class CustomCupertinoSheet extends ConsumerWidget {
  final VoidCallback? onpressed1;
  final VoidCallback? onpressed2;
  bool x;
  CustomCupertinoSheet({Key? key, this.onpressed1, this.onpressed2, this.x = true}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeChange = ref.watch(themeRiverpod);

    return CupertinoActionSheet(
      title: Text(x ? 'Dili seç' : 'Temanı seç'),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: x
              ? onpressed1!
              : () {
                  print("Açık");

                  themeChange.changeAppTheme(AppTheme.LIGHT.rawValue());
                },
          child: Text(x ? '🇹🇷 Turkish' : 'Açık'),
        ),
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: x
              ? onpressed2!
              : () {
                  print("Koyu");

                  themeChange.changeAppTheme(AppTheme.DARK.rawValue());
                },
          child: Text(x ? '🇬🇧 English' : 'Koyu'),
        ),
      ],
    );
  }
}
