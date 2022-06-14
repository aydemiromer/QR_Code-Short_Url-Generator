import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shorten_app/core/constants/enums/network_status.dart';

import 'package:shorten_app/products/model/url_model.dart';
import 'package:vexana/vexana.dart';

import '../../core/constants/enums/network_enums.dart';
import 'IService.dart';

class GeneralService extends IService {
  GeneralService(INetworkManager manager) : super(manager);

  @override
  Future<UrlModel?> shortUrl(UrlModel model, BuildContext context, String url) async {
    final response = await manager.send<UrlModel, UrlModel>(NetworkRoutes.SHORTEN.rawValue + url,
        parseModel: UrlModel(), method: RequestType.POST, data: model);

    var code = Hive.box('myBox');

    response.error?.statusCode != null ? code.put("code", "400") : code.put("code", "201");
    if (response.data is UrlModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
