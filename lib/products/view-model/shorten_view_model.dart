import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shorten_app/core/init/app/base/base_view_model.dart';
import 'package:shorten_app/core/init/network/vexana_manager.dart';
import 'package:shorten_app/products/model/url_model.dart';
import 'package:shorten_app/products/service/IService.dart';
import 'package:shorten_app/products/service/service.dart';

final authServiceRiverpod = Provider<UrlViewModel>((_) {
  return UrlViewModel();
});

class UrlViewModel with BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late IService generalService;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    generalService = GeneralService(VexanaManager.instance.networkManager);
  }

  String? res;

  Future<void> shortUrl(BuildContext context, String url) async {
    final response = await generalService.shortUrl(UrlModel(), context, url);

    res = response?.result!['short_link'];
    print(response?.ok);

    return response?.result!['short_link'];
    /*if (key2.currentState!.validate()) {
     3333 // ignore: unused_local_variable
      final response = await loginService.forgotPassword(
          ForgotModel(email: emailController!.text), context);

      //Snackbar for login
    }*/
  }
}
