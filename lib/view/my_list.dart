import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:shorten_app/core/components/space_height_container.dart';
import 'package:shorten_app/core/extensions/context_extension.dart';
import 'package:shorten_app/products/widgets/buttona/custom_elevated_button.dart';

import '../products/widgets/bottom_navbar/navbar.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  GlobalKey previewContainer = GlobalKey();

  late final Box contactBox;
  @override
  void initState() {
    super.initState();
    contactBox = Hive.box('myBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CurvedNavigationBarWidget(indexnavbar: 1),
        body: _body(context, previewContainer, contactBox));
  }
}

Widget _body(BuildContext context, previewContainer, contactBox) => Column(
      children: [
        const SpaceHeightBox(height: 0.07),
        Padding(
          padding: context.paddingLow,
          child: SizedBox(
              height: context.height * 0.11,
              width: context.width * 1,
              child: Text(
                "My List ⚡️",
                style:
                    context.textTheme.headline4?.copyWith(color: context.colors.primary, fontWeight: FontWeight.bold),
              )),
        ),
        ValueListenableBuilder(
          valueListenable: Hive.box('myBox').listenable(),
          builder: (context, Box box, child) {
            return box.length != 0
                ? Container(
                    height: context.height * 0.63,
                    decoration: BoxDecoration(
                        color: context.colors.onBackground,
                        borderRadius:
                            const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
                    child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: my_texts(box, index, context),
                          leading: QrImage(
                            data: box.getAt(index)!.text.toString(),
                            version: QrVersions.auto,
                            size: 120,
                            gapless: false,
                          ),
                          children: [subExpansionTile(context, previewContainer, box, index)],
                        );
                      },
                    ),
                  )
                : Text(
                    "List is Empty",
                    style: context.textTheme.headline1,
                  );
          },
        )
      ],
    );

SizedBox subExpansionTile(BuildContext context, previewContainer, Box<dynamic> box, int index) {
  return SizedBox(
    height: context.height * 0.25,
    child: Column(
      children: [
        Padding(
          padding: context.paddingLow,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            RepaintBoundary(
              key: previewContainer,
              child: QrImage(
                data: box.getAt(index)!.text.toString(),
                version: QrVersions.auto,
                size: 120,
                gapless: false,
              ),
            ),
            my_texts(box, index, context),
            deleteButton(box, index)
          ]),
        ),
        shareButton(previewContainer, box, index)
      ],
    ),
  );
}

IconButton deleteButton(Box<dynamic> box, int index) {
  return IconButton(
      onPressed: () {
        //box.clear();
        box.deleteAt(index);
      },
      icon: const Icon(
        Icons.delete,
        size: 40,
      ));
}

CustomElevatedButton shareButton(previewContainer, Box<dynamic> box, int index) {
  return CustomElevatedButton(
    borderRadius: 20,
    child: const Text("Paylaş"),
    onPressed: () {
      ShareFilesAndScreenshotWidgets().shareScreenshot(
          previewContainer, 500, "Qr && Url Creator", "qr.png", "image/png",
          text: box.getAt(index).link);
    },
  );
}

// ignore: non_constant_identifier_names
Column my_texts(box, int index, BuildContext context) {
  return Column(
    children: [
      Text("${box.getAt(index).text}",
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.headline5?.copyWith(color: context.colors.primary, fontWeight: FontWeight.bold)),
      box.getAt(index).link != "null"
          ? Text(
              "${box.getAt(index).link}",
              style: context.textTheme.headline6?.copyWith(color: context.colors.primary, fontWeight: FontWeight.bold),
            )
          : const Text("")
    ],
  );
}
