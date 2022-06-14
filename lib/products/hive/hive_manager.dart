import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shorten_app/products/model/modelim.dart';

final StateRiverpod = Provider<ManageHive>((_) {
  return ManageHive();
});

class ManageHive {
  Box? contactBox;
  var contactBox2;

  Future<void> init() async {
    contactBox = await Hive.openBox('myBox');
    contactBox2 = contactBox!.listenable();
  }

  Future<void> save(link, text, qrText) async {
    await contactBox!.add(MyList(link: link, text: text, qrText: qrText));
  }

  Future<void> clearAll() async {
    await Hive.deleteFromDisk();
  }
}
