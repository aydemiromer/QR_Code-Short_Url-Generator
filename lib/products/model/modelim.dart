import 'package:hive_flutter/hive_flutter.dart';

part 'modelim.g.dart';

@HiveType(typeId: 0)
class MyList extends HiveObject {
  @HiveField(0)
  String? qrText;

  @HiveField(1)
  String? text;

  @HiveField(2)
  String? link;

  MyList({this.qrText, this.text, this.link});
}

@HiveType(typeId: 1)
class ThemeModel extends HiveObject {
  @HiveField(3)
  String? theme;

  ThemeModel({this.theme});
}
