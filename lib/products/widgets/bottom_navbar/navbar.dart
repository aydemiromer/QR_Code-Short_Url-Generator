import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shorten_app/core/extensions/context_extension.dart';
import 'package:shorten_app/view/home_page.dart';
import 'package:shorten_app/view/my_list.dart';

class CurvedNavigationBarWidget extends StatelessWidget {
  final int indexnavbar;
  const CurvedNavigationBarWidget({Key? key, required this.indexnavbar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: indexnavbar,
      animationCurve: Curves.easeInOut,
      backgroundColor: context.colors.onBackground,
      color: context.colors.background,
      items: const <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.list, size: 30),
      ],
      onTap: (index) async {
        if (index == 0) {
          await Hive.close();
          await Hive.openBox('CodeBox');
          await Hive.openBox('myBox').whenComplete(() => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              ));
        } else {
          await Hive.close();
          await Hive.openBox('CodeBox');
          await Hive.openBox('myBox')
              .whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidget())));
        }
        //Handle button tap
      },
    );
  }
}
