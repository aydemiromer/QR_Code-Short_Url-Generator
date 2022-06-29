import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shorten_app/core/components/space_height_container.dart';
import 'package:shorten_app/core/constants/snackbar/snackbar.dart';
import 'package:shorten_app/core/extensions/context_extension.dart';
import 'package:shorten_app/core/init/app/base/base_widget.dart';
import 'package:shorten_app/core/mixin/loading_mixin.dart';
import 'package:shorten_app/products/model/localizes.dart';
import 'package:shorten_app/products/view-model/shorten_view_model.dart';
import 'package:shorten_app/products/widgets/bottom_navbar/navbar.dart';
import 'package:shorten_app/products/widgets/buttona/custom_elevated_button.dart';
import 'package:shorten_app/products/widgets/ios_sheet/cupertino_sheet.dart';

import '../products/init/lang/locale_keys.g.dart';
import '../products/model/modelim.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _DenemeState();
}

class _DenemeState extends State<HomePage> with LoadingState {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: qrText);
  }

  bool counter2 = false;
  int counter = 0;

  // ignore: unused_element
  void _decrement() async {
    setState(() {
      counter2 = true;
    });
    for (var x = 0; x < 5; x++) {
      setState(() {
        counter++;
      });
      await Future.delayed(const Duration(microseconds: 10));
    }
  }

  String qrText = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  bool qr_visible = false;
  int indexnavbar = 0;
  @override
  Widget build(BuildContext context) {
    return BaseView<UrlViewModel>(
        viewModel: UrlViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (
          BuildContext context,
          UrlViewModel value,
        ) =>
            Scaffold(
              bottomNavigationBar: const CurvedNavigationBarWidget(indexnavbar: 0),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: context.height * 0.1, child: _languageAndTheme()),
                      _qr(),
                      qr_visible ? myTextFormField() : myTextFormFieldUrl(),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              qr_visible == false ? qr_visible = true : qr_visible = false;
                            });
                          },
                          child: Text(!qr_visible
                              ? LocaleKeys.home_page_text_button_qr.tr()
                              : LocaleKeys.home_page_text_button.tr())),
                      const SpaceHeightBox(height: 0.1),
                      _button(value, context),
                    ],
                  ),
                ),
              ),
            ));
  }

  Center _button(UrlViewModel value, BuildContext context) {
    return Center(
        child: CustomElevatedButton(
      borderRadius: 20,
      child: !value.isLoading
          ? const CircularProgressIndicator(
              color: Colors.green,
            )
          : Text(LocaleKeys.home_page_elevated_button.tr()),
      onPressed: () async {
        var box = Hive.box('myBox');
        var box2 = Hive.box('CodeBox');

        if (!qr_visible) {
          value.shortUrl(context, _textController.text).whenComplete(() {
            if (box2.get("code") != "400") {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBarClass.successSnackBar(context.colors.primary, "Success"));

              var liste = MyList()
                ..qrText = _textController.text
                ..text = _textController.text
                ..link = value.res.toString();

              box.add(liste);

              liste.save();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBarClass.cancelSnackBar(context.colors.onError, "Error"));
            }
            setState(() {
              value.isLoading = true;
            });
          });
        }

        setState(() {
          counter2 = false;
          counter = 0;
        });
        //changeLoading();
      },
    ));
  }

  SizedBox _qr() {
    return SizedBox(
      height: context.height * 0.4,
      child: Center(
        child: QrImage(
          data: qrText,
          version: QrVersions.auto,
          size: 200,
          gapless: false,
        ),
      ),
    );
  }

  // This shows a CupertinoModalPopup which hosts a CupertinoActionSheet.
  void _showActionSheetLanguage(BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CustomCupertinoSheet(
              onpressed1: () {
                context.setLocale(Localizes.tr.value);
              },
              onpressed2: () {
                context.setLocale(Localizes.en.value);
              },
            ));
  }

  // This shows a CupertinoModalPopup which hosts a CupertinoActionSheet.
  void _showActionSheetTheme(BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CustomCupertinoSheet(
              x: false,
            ));
  }

  Row _languageAndTheme() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              _showActionSheetLanguage(context);
            },
            icon: Icon(
              Icons.language,
              color: context.colors.onPrimary,
            )),
        IconButton(
            onPressed: () {
              _showActionSheetTheme(context);
            },
            icon: Icon(
              Icons.light_mode_outlined,
              color: context.colors.onPrimary,
            )),
      ],
    );
  }

  Padding myTextFormFieldUrl() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autocorrect: false,
        controller: _textController,
        onChanged: (value) => setState(() {
          qrText = value;
        }),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: LocaleKeys.home_page_text_field_label_url.tr(),
        ),
      ),
    );
  }

  Padding myTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autocorrect: false,
        controller: _textController,
        onChanged: (value) => setState(() {
          qrText = value;
        }),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: LocaleKeys.home_page_text_field_label.tr(),
        ),
      ),
    );
  }
}
